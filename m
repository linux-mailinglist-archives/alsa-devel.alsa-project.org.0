Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1782EB7E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:29:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21994202;
	Tue, 16 Jan 2024 10:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21994202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705397356;
	bh=h/99NiF4A2BrTs/f1i+EHbcfLqSPcc4NdjFBKleOmWo=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KHS0K8hrD6quvQKy4jnW33Ng8vYXmKqN2SgymskILN06k2tCcHrOs6iwgJFpBZYY7
	 gFOZNtMBGeOu0b+NZRufAi2NbD1YIhG6BCUO1aX0E1MgjQImmeJC5zzrr2dN1ZN3Se
	 KkGE63W4XK79xdzbY6oDER0vSF6M7OhEbVPwZjA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E49EF80578; Tue, 16 Jan 2024 10:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33990F8057B;
	Tue, 16 Jan 2024 10:28:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6617DF80254; Thu, 11 Jan 2024 14:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com
 [IPv6:2a00:1450:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76C7AF8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 14:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C7AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=1jFVWRqE
Received: by mail-wr1-x449.google.com with SMTP id
 ffacd0b85a97d-33768a5f55cso3175839f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jan 2024 05:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704980003; x=1705584803;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/99NiF4A2BrTs/f1i+EHbcfLqSPcc4NdjFBKleOmWo=;
        b=1jFVWRqEQ4VemK66LM18/IbJUuZuGndhZ+bWR9bGWjxSqiRnmJfN1v4JT42OkL/pQE
         c7ePLo56lb0AZpH+TzOFdBXWs78XqNKepzts6prUJW31/BS0IFah7E5jyAa2p05n/hMr
         aARLoZ9M8kb9QtA9XkxcqAaK9zoFyJaa7EizPYiPV4w6iI092GrkCf9cGP3qDbXyQ55c
         FXlUYamp8QS0D8/N6lcoFdvr8snzRbzxl8+ABr5AtLhdG1rmOVKRJLllHgrM+r2vYfmf
         SpJAsAb/1xXTcNK9PerRjaHVP9l3R+y5h4Ny8atXbmkCK66zYc4fLlACqZ+B8IF/J901
         6OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704980003; x=1705584803;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h/99NiF4A2BrTs/f1i+EHbcfLqSPcc4NdjFBKleOmWo=;
        b=A/WceEvmrj/auOboy/UWQp9HLtiygZ28P/vQKUSRG1H+rJat8aKLZeTJndbVfPr43u
         c6S5DbkmjA+Wh2CcPSFHJHA1tSK1KPUeq9C5X8HFTaRjS/nvk+h8A68W2AIHRHYy4W3B
         mnH+SpD11By61x0iUk/ZIhIY7pj9BVxoe3m5pxEm3zT9bJPxOIXznaEaAj0JueLZL9i1
         KkW0ztQIRr00PHVzKUv9CMJ+IsYH1m1mO/y0+1dKdi3DNWKae28haUyq83XZRJ+e0zhc
         7+wSG8WlAHc+bG79uFjtS+tigrrT5Wq6t+3GcKuK0CwFZ6ctMchmWMYIAktZj84iGOWc
         3A1w==
X-Gm-Message-State: AOJu0YwT0Uc83+bImigwayOaexRQNbQiES26VXXRbP+ufQD2Q0gRbD95
	kE9rgq2DxvAG4OhuqkUxfSfQDUBq1MCnKJdm+L8=
X-Google-Smtp-Source: 
 AGHT+IFsuF9J9DQ1b9o9M0B0uCNQ4u2/hpHiLtI0CB158k+7cM7TbsSjNtoX1gjNCAU74IrCTBCB2sPeakzF
X-Received: from dextero.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:364e])
 (user=dextero job=sendgmr) by 2002:a05:600c:350b:b0:40e:59e4:6563 with SMTP
 id h11-20020a05600c350b00b0040e59e46563mr9699wmq.0.1704980002699; Thu, 11 Jan
 2024 05:33:22 -0800 (PST)
Date: Thu, 11 Jan 2024 13:33:20 +0000
In-Reply-To: <20230209115916.917569-1-aiswarya.cyriac@opensynergy.com>
Mime-Version: 1.0
References: <20230209115916.917569-1-aiswarya.cyriac@opensynergy.com>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240111133320.2717702-1-dextero@google.com>
Subject: Re: [RESEND PATCH 0/1] ALSA: virtio: add support for audio controls
From: Marcin Radomski <dextero@google.com>
To: aiswarya.cyriac@opensynergy.com
Cc: alsa-devel@alsa-project.org, anton.yakovlev@opensynergy.com,
	jasowang@redhat.com, linux-kernel@vger.kernel.org, mst@redhat.com,
	perex@perex.cz, tiwai@suse.com, virtio-dev@lists.oasis-open.org,
	virtualization@lists.linux-foundation.org, vill@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: 
 3Iu6fZQcKCrEUVokVifXffXcV.TfdRcjR-UVmVcRcjR-gifaVTk.fiX@flex--dextero.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PN26PEQOJX2TMM2F4NUQBI36WIYZIELN
X-Message-ID-Hash: PN26PEQOJX2TMM2F4NUQBI36WIYZIELN
X-Mailman-Approved-At: Tue, 16 Jan 2024 09:26:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN26PEQOJX2TMM2F4NUQBI36WIYZIELN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Aiswarya,

I was looking into VirtIO audio controls support in Linux and came across t=
his patch series, which seems to be marked "archived" on patchwork [0]. I w=
ould love to be able to use this with mainline Linux. I'm wondering about t=
he status of this series - is the feature still under development, or are t=
here some concerns that need to be addressed?

I'd be more than happy to help with testing.

Thanks for any insights or updates you can offer.

Regards,
Marcin Radomski

[0] https://patchwork.kernel.org/project/alsa-devel/patch/20230209115916.91=
7569-2-aiswarya.cyriac@opensynergy.com/
