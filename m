Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B839177DFBD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 12:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D22886;
	Wed, 16 Aug 2023 12:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D22886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692183427;
	bh=U5IJi2OKgJ8q0AvoEkgnm7NzkV1LZqSI5AfA5il0DVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6tokaenjteW4T9RPRAb5ZLfK834H9j9JzJtIJcuXQTzwjGhKY97vDaG2A4RaiDtW
	 OuBEZLwmzVWAuxHiN+RO9BxohVsN0hVQdJ8v0pRPfEUBNghPaluD0V1AQsb4TwUKdO
	 /geSNxOuqf8mngzzVCUHx1r1Roy4cpnffj/MIe40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CBDF8057D; Wed, 16 Aug 2023 12:55:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A92F8057E;
	Wed, 16 Aug 2023 12:55:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D00EF8016D; Tue, 15 Aug 2023 19:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3D61F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 19:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D61F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lco7tKGV
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4104256bdd0so7515961cf.1
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692119740; x=1692724540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7Zqt1cL5fLnWs4figI/iiuzESoCetkMl6efPNFPHqk=;
        b=lco7tKGVTWF9DwFBb4wRy9G91MMCvgemXxK+6tDsjv1WOadiJ5sPcnNEj8wko8wWlb
         jqkOSKfprqfo4KEPj/lfZoWIjMoxn8/MCK4clGnV1carj97CVXYbE8VsYhioP8Ylv91t
         UrKclQWhWdL2p3n/3uNtjWNxVVpDnUpu0HzxQtWSuf24qCeJEyCU3My+F6Xgnog85VHN
         7cyCRSHJ4E4CH2I2Lt751sNKG2ZXtcvIbWvzEPtDm8UAJcaJWa1royGRA0L9ywuld0ab
         AjsPN51NbszKq3hUAXQU25Ix64CHE5l0OqYfcckxft/HHzFAFXq9AgqFQD+rsPwOcxCT
         5PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692119740; x=1692724540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7Zqt1cL5fLnWs4figI/iiuzESoCetkMl6efPNFPHqk=;
        b=O9m8NZigVMm3BSjnNCKcsUJkBfYaDhTpkx59CXtNRIlsUnzc9Ipf/ewq3MNF5Ywnrb
         zixfJRav9S5oCl9ZP5l1amwVJ+RNAMPyBqaZ1FTvnTJtF6eT2WBhlPFSiyw+FXD+L1LY
         HhBhQBeeuEdqGojGE/RGfTYmO8JrkBQEU4stKxMK3zzRcUxwFfWX3Xmo3T04pqbGnQYU
         G7Ne7dEA71ottcdgTqIcb0kjyMOpRk1bgxfi1U9UqKN6ooedQtJAHuZXkMqznq038nre
         oGIiRh9IWlP5IYLobW9ocuX2O/uB/Vh4mBTyaHIr6toX21IZQmFua7m5dQ+kua7bB1CH
         Yo3A==
X-Gm-Message-State: AOJu0YyzKBG/XUpaCXYXfcebwoSXYC8XEA0HYwYCgncVJXaN0NphHC1p
	SXdA6L4TVhuQyCyEtvjv364=
X-Google-Smtp-Source: 
 AGHT+IH+F8hApKQBKJzFLt2Fka800aiZoFsw9K2fBLyL3tXVdd1Vp6JexkzJQQ59uxbcQAC2g28xmQ==
X-Received: by 2002:a05:622a:19a0:b0:403:b11f:29f0 with SMTP id
 u32-20020a05622a19a000b00403b11f29f0mr18964390qtc.0.1692119740012;
        Tue, 15 Aug 2023 10:15:40 -0700 (PDT)
Received: from arch (c-68-32-9-74.hsd1.mi.comcast.net. [68.32.9.74])
        by smtp.gmail.com with ESMTPSA id
 d18-20020ac81192000000b00403ff38d855sm3921495qtj.4.2023.08.15.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 10:15:39 -0700 (PDT)
Date: Tue, 15 Aug 2023 13:15:37 -0400
From: Brady Norander <bradynorander@gmail.com>
To: Curtis Malainey <cujomalainey@google.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	broonie@kernel.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	cujomalainey@chromium.org
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
Message-ID: <ZNuyuerb0M6IGRKj@arch>
References: <ZNuDLk5hgmfKrZg6@arch>
 <850c5b2c-265e-a565-8a88-58a88f8fb4e8@linux.intel.com>
 <CAOReqxjbjkhkqfvTWs9i5NxK6QAsk42Daw1pA_1+b1zG5mbKmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAOReqxjbjkhkqfvTWs9i5NxK6QAsk42Daw1pA_1+b1zG5mbKmQ@mail.gmail.com>
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YNZBYS5L3ETYSL67QVKG7AWDM7TQTKWI
X-Message-ID-Hash: YNZBYS5L3ETYSL67QVKG7AWDM7TQTKWI
X-Mailman-Approved-At: Wed, 16 Aug 2023 10:55:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNZBYS5L3ETYSL67QVKG7AWDM7TQTKWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 09:56:44AM -0700, Curtis Malainey wrote:
> On Tue, Aug 15, 2023 at 8:56 AM Pierre-Louis Bossart <
> pierre-louis.bossart@linux.intel.com> wrote:
> > On 8/15/23 08:52, Brady Norander wrote:
> > > AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> > > default. Add a quirk to use the SOF driver on these platforms, which is
> > > needed for functional internal audio.
> > >
> > > Signed-off-by: Brady Norander <bradynorander@gmail.com>
> >
> > Thanks for the patch
> >
> > Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >
> 
> Now that I am looking closer at the patch, I am very curious why we are not
> hitting the following case and using SOF

The DMIC detection looks for DMIC endpoints in the NHLT, but these
devices don't have NHLT.
