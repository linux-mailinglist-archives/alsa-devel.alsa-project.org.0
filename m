Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A385B468
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5961933;
	Tue, 20 Feb 2024 09:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5961933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416278;
	bh=IqXAlLKeekccseiZoETdUwjQ0rAhOYE1/rlcGiLxS4M=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2+/onKuVrSLMS1mxtmm0pbmHnBwIDwfLIzxQbTYYgzC7rdgvDDD9ImaEkVCw8BZo
	 Yd09XvaiMxC3qI1K5P47aoNARwIIqIp1ooVVGAUbdGWYZ5P4y7fTAWEUXIf6vtuY9d
	 R+qf5vFpr/yaFULvGr7LqnBwZiUyj/LrYIkmmBhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42943F806B6; Tue, 20 Feb 2024 09:02:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E4AF805C5;
	Tue, 20 Feb 2024 09:02:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F126F80496; Mon, 19 Feb 2024 18:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDBE1F800EE
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 18:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBE1F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=UUBW/H8M
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dcc15b03287so6375136276.3
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Feb 2024 09:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708363471; x=1708968271;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqXAlLKeekccseiZoETdUwjQ0rAhOYE1/rlcGiLxS4M=;
        b=UUBW/H8My13joYKbws/eSfCfHuntSgdXG4mnW0LzFKARUpanOTsT0Vq1+33/jPng3m
         WtVdFXo+lGdyyO9TXXkDSno8bEQfyY+RCcOVcHvm7upBTC8wr8loY/s1mnk5e/6CXRC4
         bBW+7dnzBxv9vMBPFl3g1WZFkzNcX7iw7xbeTFfG8ulAJWCQvyhZNu7rp/WNzlh4B/dT
         dpP0QuXUUHtPqncDXAXyLTDc4Ial4yHH0uGVfMASKWV/GSFL/q0ZXOhdrQEt0lun3VEG
         /I9Cv2P9VhTDH6zTLxaaRbCzImsp0a74kRBga8UWRukDTM/q/IS/5p0t72WkQpyDv/E5
         nH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363471; x=1708968271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqXAlLKeekccseiZoETdUwjQ0rAhOYE1/rlcGiLxS4M=;
        b=PbBYRy52w8B891XrUAzjoZrDM1mlR6mAm+GBAVzPq6HvY78LEg1Y8UX3M9O9x937xO
         9DypVTMRh7008AqvxY0d+O1PyKMETLb5SSjHfvYSw1tYy5dE+PS7YoA5k5St2StAi1mE
         CsvPceexExPlb39YojajEWdNR4F1xBrPo37zfmQlQNA6yQuzuZcc1tMVAcUgsTKQsu4M
         lFpG0P0V/4xt+8SiiXwFsZH5/TWoyVCJKYHAzabcv3QBwSH3tkBRMjucIlDGKs0fIqmJ
         2jFg1rpdHFyi/22ANdo9kovcigMAnwmgI+5PoaKxMSBiWYo9L968IbD4cD8HEwG4Svs9
         4KYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWxbHbnRAB8XFbXzd+BVkiMYthaJidgnv0dI3M+Et3zmRjAza5MhElWtuNbONe7WxFFqAOyB4TEdj4eHZyJNw6Rb/Srcqgbjag1WA=
X-Gm-Message-State: AOJu0YzO8CniB/1LyrLMvLHZid0agGMbYBBzvXpkSfUfyaF8d7UCjhGq
	vWDU6l+pL54H/wm/eJ/ciq2pSKnDT+mBllDy/TOp++ln8LiANtY/j2rZO7oDe/PiuNrb/MaoAKO
	XOqu2Mw==
X-Google-Smtp-Source: 
 AGHT+IHb/LI2umaPKzrGXSM6YYmMbRda0hH22YF1Jjo5mhqYj23QHtTxbCVUfsVZSjB+mHPk+SsGS1fXXoBd
X-Received: from dextero.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:364e])
 (user=dextero job=sendgmr) by 2002:a05:6902:1001:b0:dcc:79ab:e522 with SMTP
 id w1-20020a056902100100b00dcc79abe522mr524910ybt.11.1708363470612; Mon, 19
 Feb 2024 09:24:30 -0800 (PST)
Date: Mon, 19 Feb 2024 17:24:17 +0000
In-Reply-To: <20240115133654.576068-2-aiswarya.cyriac@opensynergy.com>
Mime-Version: 1.0
References: <20240115133654.576068-2-aiswarya.cyriac@opensynergy.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240219172417.1383044-1-dextero@google.com>
Subject: Re: [v2 PATCH 0/1] ALSA: virtio: add support for audio controls
From: Marcin Radomski <dextero@google.com>
To: aiswarya.cyriac@opensynergy.com
Cc: vill@google.com, alsa-devel@alsa-project.org,
	anton.yakovlev@opensynergy.com, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, mst@redhat.com, perex@perex.cz, tiwai@suse.com,
	virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
	Marcin Radomski <dextero@google.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3zo7TZQcKCm8QRkgRebTbbTYR.PbZNYfN-QRiRYNYfN-cebWRPg.beT@flex--dextero.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3RDTW6GNCAKFJWG66FPNWMVC523NWXV7
X-Message-ID-Hash: 3RDTW6GNCAKFJWG66FPNWMVC523NWXV7
X-Mailman-Approved-At: Tue, 20 Feb 2024 08:01:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RDTW6GNCAKFJWG66FPNWMVC523NWXV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Anton for the reupload.

I tested this series with a 6.1 kernel guest on a proprietary hypervisor. The
controls exposed by the host (BOOLEAN/INTEGER ones, as that was all I could
get) worked as expected when adjusted via ALSA APIs.

Reviewed-by: Marcin Radomski <dextero@google.com>
Tested-By: Marcin Radomski <dextero@google.com>
