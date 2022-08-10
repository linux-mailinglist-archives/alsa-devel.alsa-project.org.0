Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB358E494
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 03:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F8186F;
	Wed, 10 Aug 2022 03:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F8186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660095462;
	bh=owBpBsEeFKZRUUqs8Nvc+1xIGU5tFBCMRX6dRGyD3Hs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nzxb85nrgjekYCqcrsTjUV2kZQ7PzP6epAn8Iffe1v+s627j1r0YHi0PybijOZ5ko
	 f4nHeMTCQM4vqlejHiCbooeInVns0GJzo1jlAI7QDnmFhIn8PKmqwUWrS3H2x7MFDh
	 jh0kpfXkfptlXKdnMms9T08vcmdIyWfa9oaN7PLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D69EF801F7;
	Wed, 10 Aug 2022 03:36:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B360CF8016C; Wed, 10 Aug 2022 03:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07E61F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 03:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E61F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TIk4h5vy"
Received: by mail-pg1-x52c.google.com with SMTP id s206so13018787pgs.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 18:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/3NuyMRQzoKC+30JhlTYDeaL3RcsG7yIW6Z9cFFfjYs=;
 b=TIk4h5vytpc27gGiVHL/Zrmje4fW6GQvWgMmzc0aDOrKc5mzhv1gN47UGWzYCEzXzh
 LxEe/VPiJdO9nnVQlrNDve8jixOsZRZzopSYmaGbn1ac3OfqRkLiP5hcRkqPF/20kAq9
 RmCYIbdYelLHyZ1iGeBMiXxQ0wG8KoKFWWM/3MOaHcaSdVrHVIhJ1zS1BhAo/gpsyLUp
 LkmwdiVI4ZP075vqmfQeQCkvcHH4n9gcfm3giqM/yUkRuq0d5S3PtICuhUcqxpkXAYKU
 uOR8m30G4W4mOzjrlQ0+OtsG76wdPkSJ4LoJlD2fPco9hMxfvKWel1jS1usnVh5GtPIG
 8HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/3NuyMRQzoKC+30JhlTYDeaL3RcsG7yIW6Z9cFFfjYs=;
 b=ROn/DJdVIGA8IuHgAhqjjZEjADBL4h2jBuj/qQerVBYSbsUWiSVYxBdjnmBdrzR14P
 L+yiaGs8m44R5crNzFh9PwgMo7piT5/scPdV9sS5pkPFW2mYP7YooT5K7mORrQkQaBL+
 9taZfrIWIVwcQPs4TK/IvRBCpFkeF0M23MBmgWuJtdd1mDhGqXfO89S+HO2XupZzc0o/
 S3KtlprrKRkiFc0VmomRBcumacuGuXVSdij5N3mGJxZ2URBFtjFT6+vgjHHbkqLgKxGx
 27jhEi+wInMQG6taXIn+U3UQ+KC5Uiks27kMCfjH6BgdU92Xxrqe2CfvLBfk+8k3OFYX
 xnLQ==
X-Gm-Message-State: ACgBeo02TUFuoIES7Y3D4YyEgRHD0Di58WZSrIlOpK1ALSOgkGUADR9z
 ObDcyX+30lGwp/RMcg1zoIISSW+QImOFoIdQdXc=
X-Google-Smtp-Source: AA6agR54MJrLFSYH1fgiFQjFXxiww0+dZxx5K2tkUWlOhgLPmnfl1+2I00/DFJahPjW3j5GLPcFDow==
X-Received: by 2002:a62:6206:0:b0:52d:39c5:298 with SMTP id
 w6-20020a626206000000b0052d39c50298mr24870107pfb.30.1660095393729; 
 Tue, 09 Aug 2022 18:36:33 -0700 (PDT)
Received: from a-VirtualBox.tendawifi.com ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a17090a115600b001f4dd3b7d7fsm265197pje.9.2022.08.09.18.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 18:36:33 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v5 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Wed, 10 Aug 2022 09:36:27 +0800
Message-Id: <20220810013627.1156202-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220809183412.GA2152771-robh@kernel.org>
References: <20220809183412.GA2152771-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: robh@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>> +  everest,jack-detect-inverted:=0D
>> +    description:=0D
>> +      Defined to invert the jack detection.=0D
>=0D
>What's the difference with this and bit 3 of everest,jack-pol?=0D
>=0D
>We already have numerous vendor properties for jack detect. Can we come =0D
>up with something common?=0D
>=0D
>The problem with 'inverted' is it assumes you know the non-inverted =0D
>state. Better to just state high or low.=0D
=0D
This property is in compatible with the property in es8316.c and sof_essx83=
36.c.=0D
(which is not documented in es8316.yaml, another problem)=0D
There is a quirk in sof_essx8336.c so that when the user find they're havin=
g a =0D
wrong jack insert configuration, they can set the quirk to invert it.=0D
