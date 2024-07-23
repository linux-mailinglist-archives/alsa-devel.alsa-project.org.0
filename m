Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A4942976
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2BBF50;
	Wed, 31 Jul 2024 10:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2BBF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415552;
	bh=LqkjbtqpwsvD6irvMKsUzQm23DdSEtCegougaYPwBb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j38pQED8b1qlRoJZ0G/HFf+8+ZpviSs49gBqnI/qwWtR+ejzeDEx/I6Xy3xZwCfwL
	 pACfSJzrty89a+lwWHCmcMuakXfmOCDHiBrLU2cunMBrgQTCIuI3wkz6XtoSe8tmaU
	 qdRgltEwsTmSgs2oz0Vc6hyMemJ2h28S/YOsBIRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 754EFF805AE; Wed, 31 Jul 2024 10:45:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C3A3F80448;
	Wed, 31 Jul 2024 10:45:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75106F801F5; Tue, 23 Jul 2024 17:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2715F800C9
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 17:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2715F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CZrgMQa8
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7044bda722fso3270553a34.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jul 2024 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721749139; x=1722353939;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrK0UXWlpbKJ090e0e3tzuMfddfgd69GL57oA2q1Do4=;
        b=CZrgMQa8cjVzigqkS3qXhwP4GAVz9WULC+MfrPg0W4R+GtwHsgKA2gwpEhFSyKsS90
         db8GOWhIgrzdAjr7YZ4yiLL908H1v7AjVWLEYlw1C4TKFtor2F+llJR/bzegnbEUZELx
         xXSwDnt/U6Mz+UPE5wC6Tku47g8a0j5aaor3aVAevyCUQinM9Sp8/hO6AHaxQi/ii+aB
         pIzcLazwpVDkq6T4dRVOrwedRfSkZ+0mJ5ioYOWcLQ3QX9kazKu/qhnGkBoL0d1qytUe
         +dBwg5HF8WkjvDZums9xtxF9enzww2KINutt+v+Dh0075Q2jbJBolObIzm1iZL5xZ8ci
         imvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749139; x=1722353939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrK0UXWlpbKJ090e0e3tzuMfddfgd69GL57oA2q1Do4=;
        b=Ex0JbWL1mDRBSfjvAMNq7t+oZr2cn0yXgh30qIMB9NLl6UOX4dtwaUI3qRcjyLLuJh
         eHfz9OjU/26KpC7aOKlkGJVjOYrlBJTB7Dx4cQGX1j3qAwevsL0BB4x/oIyWhkA0fpqa
         99+pWe5shfqGvjsBwvknPhy25VGWxkTklMwFcXJjHabeD3cI7zKS1A0tVhqlt2NR4Y4P
         Nm8XoEKVfJwEhbe1o80oEgcDW5niJtzDg3J6+iqofUTpEHu/FYQIZlPSF3lZtZP+azdo
         YGcomdqlP4WFOHFKX0KGhO715U4G7YwbSPBDRs6P0H/ImtNLtxSaQzhXEqefrdhH9LRb
         pmyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB4kQ11yrhtJYt46clWBggR+7VxTNYdqHJd4+/r1DSNJtMugL1azbEsyoGmrt8epeP96z49V2NEKstIc/CxOLZXMCeGomQV8huHZw=
X-Gm-Message-State: AOJu0YwEpKaLADI2bQakn+3LIGeoth2/lyzM1+mlLOLQQVZTqcZgeUwF
	4WyyJva4FFkvuOpBEA9eG3wffddslQ5v1AI0oTfjwb21azmZfpi/h2H3JnzO8ps=
X-Google-Smtp-Source: 
 AGHT+IG3gOY3GBGSAIwmggul7hffPHMXaMDevCa/MxXDME5o5zKlku823JsGxkRP8YZNuITVW34JGw==
X-Received: by 2002:a05:6830:dc3:b0:704:4948:c4b9 with SMTP id
 46e09a7af769-709234a7813mr200705a34.24.1721749139067;
        Tue, 23 Jul 2024 08:38:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id
 46e09a7af769-708f60ee136sm2084491a34.47.2024.07.23.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:38:58 -0700 (PDT)
Date: Tue, 23 Jul 2024 10:38:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [bug report] ASoC: Intel: cht_bsw_rt5645: Set card.components
 string
Message-ID: <7052bf95-3aa2-4dd6-8136-d94833810463@suswa.mountain>
References: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
 <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UVZKCJLRBAKLS4SY5LILM27ASNHRP4LU
X-Message-ID-Hash: UVZKCJLRBAKLS4SY5LILM27ASNHRP4LU
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:42:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVZKCJLRBAKLS4SY5LILM27ASNHRP4LU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 22, 2024 at 04:06:58PM +0200, Pierre-Louis Bossart wrote:
> Thanks Dan for the report.
> 
> 
> > Commit f87b4402163b ("ASoC: Intel: cht_bsw_rt5645: Set
> > card.components string") from Nov 26, 2023 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	sound/soc/intel/boards/cht_bsw_rt5645.c:587 snd_cht_mc_probe()
> > 	error: we previously assumed 'adev' could be null (see line 581)
> > 
> > sound/soc/intel/boards/cht_bsw_rt5645.c
> >     570         /* set correct codec name */
> >     571         for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
> >     572                 if (cht_dailink[i].codecs->name &&
> >     573                     !strcmp(cht_dailink[i].codecs->name,
> >     574                             "i2c-10EC5645:00")) {
> >     575                         dai_index = i;
> >     576                         break;
> >     577                 }
> >     578 
> >     579         /* fixup codec name based on HID */
> >     580         adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
> >     581         if (adev) {
> >                     ^^^^
> > The old code assumes adev can be NULL
> > 
> >     582                 snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
> >     583                          "i2c-%s", acpi_dev_name(adev));
> >     584                 cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
> >     585         }
> >     586         /* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
> > --> 587         codec_dev = acpi_get_first_physical_node(adev);
> >                                                          ^^^^
> > Unchecked dereference
> 
> This looks like a problem in multiple machine drivers sharing similar
> code, if we want to consistently check the output we probably need
> something like https://github.com/thesofproject/linux/pull/5117 ?
> 

These are actually Smatch warnings, not Sparse warnings btw.  (Smatch
uses Sparse as a parser.  Everyone gets them mixed up).

regards,
dan carpenter

