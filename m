Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A05938F8E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8D0E67;
	Mon, 22 Jul 2024 15:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8D0E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653314;
	bh=F3PCANeYmq0//utKF8F6DsQ8qKP2+tt8KPbXzTRaHAM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kjbbcz/X5LyOqScKG/wsSAm+WrSn34zFlNYiDtM/3UOABswItToao4h6QrZ8PcXTo
	 5h2MaaUsc6opEanhkgFRzjHh0tSdPEHAx0aBogHM8EIHfkbXimBFspbxh7Nsm+2pen
	 kJ4QOVIQpA9WjH7aIs8RruFzSXoy1PSGDaqcBvKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA61FF805D7; Mon, 22 Jul 2024 15:00:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E4BFF805E6;
	Mon, 22 Jul 2024 15:00:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D19EF804FC; Sat, 20 Jul 2024 01:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5171CF8007E
	for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2024 01:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5171CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rwd90WdF
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-260e6dfc701so1276192fac.3
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jul 2024 16:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433218; x=1722038018;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kT2xd7QXg81X3OFuASx1Cj0YmKSJ7x0xdpvqbykI9C8=;
        b=rwd90WdFD3xbMEu77hcQuxLu5faLAY57y5e3ufo6xPzFffFtqiOjP2FSJkWwLzrL1x
         BHmMIVUaYKHiyMSFptScICzncw3YoP2UBUGepHlxjfQE+NiQehdAe4VU/xXb9aaVKTZ7
         YigbGWvefghzE6nAQXwVmufVurlvm+EEAh5rj2l7+cxj1jdZr+mB0TbDej2NxxEZs8c7
         RCcZWstajAKGwxoDobU7Oxjno73hWtvhCAPsuliYDVvS7yhTuB5hl10DlvLlGRcE2feO
         QDuW+rYS6jiB9qOCuGzRT5mvHrjtzl4SoU4NsmT24ZK2kJu45ZE59Ltq69Jy3M/6fRVl
         gyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433218; x=1722038018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kT2xd7QXg81X3OFuASx1Cj0YmKSJ7x0xdpvqbykI9C8=;
        b=vdydpAtueTFStX04hXiCDtBXWxCg8lx2F1GIEpq/tyh2GbWu/vYg1sgM6cFdx8FQvv
         9JPS8BJT4LfGIWGjIh6s7B7+nEdzTSw08dd0zeSZwY9khJavqYBVY084+PoYIZdci3bN
         qTEW6iwC9YqTuqeL0l5Pwtr97Hy4UD+ro/t9I3aCqDOhwd4+x77uCeO76DzEkuz5mY6a
         s4KLfoiXxFVuOmrQ/SgPAGWquLDfWjAUFVGNoDp0d6Dk/ELGVWF8H7kDlD4TSsajWqqH
         VHY9x1sYPxG2j5fLwHCIlMbdhUY1K3mh5PXHWcJps+wLSpjLabXvS3VcVP2J6p+vMIp5
         3Iig==
X-Gm-Message-State: AOJu0YxHK/dZw8sEWILR3VGuz0SkuV5/oRrioSX8+At+y3vRGBkZbhgv
	YrKewLVPgr2dYrt0xmVQ0PT1DFhmCkRWQYDo3JXNoa4CKVG6PswKoo613lD2ee0=
X-Google-Smtp-Source: 
 AGHT+IEl6/u5t0swkr49pw//o4Pr/v93+pUaJH7O0HkTtPQK6/I932WS1crMV+tRczVbvtmeBNBJDg==
X-Received: by 2002:a05:6870:f298:b0:261:1c5e:29d3 with SMTP id
 586e51a60fabf-2638df22c07mr95253fac.12.1721433218451;
        Fri, 19 Jul 2024 16:53:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2610ca48c79sm534776fac.45.2024.07.19.16.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:53:38 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:53:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: Intel: cht_bsw_rt5645: Set card.components string
Message-ID: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4RN5D2RM5HI5LK6Y72YEYHZEAO4RCLEQ
X-Message-ID-Hash: 4RN5D2RM5HI5LK6Y72YEYHZEAO4RCLEQ
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RN5D2RM5HI5LK6Y72YEYHZEAO4RCLEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Hans de Goede,

Commit f87b4402163b ("ASoC: Intel: cht_bsw_rt5645: Set
card.components string") from Nov 26, 2023 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/intel/boards/cht_bsw_rt5645.c:587 snd_cht_mc_probe()
	error: we previously assumed 'adev' could be null (see line 581)

sound/soc/intel/boards/cht_bsw_rt5645.c
    570         /* set correct codec name */
    571         for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
    572                 if (cht_dailink[i].codecs->name &&
    573                     !strcmp(cht_dailink[i].codecs->name,
    574                             "i2c-10EC5645:00")) {
    575                         dai_index = i;
    576                         break;
    577                 }
    578 
    579         /* fixup codec name based on HID */
    580         adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
    581         if (adev) {
                    ^^^^
The old code assumes adev can be NULL

    582                 snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
    583                          "i2c-%s", acpi_dev_name(adev));
    584                 cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
    585         }
    586         /* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
--> 587         codec_dev = acpi_get_first_physical_node(adev);
                                                         ^^^^
Unchecked dereference

    588         acpi_dev_put(adev);
    589         if (!codec_dev)
    590                 return -EPROBE_DEFER;
    591 
    592         snd_soc_card_chtrt5645.components = rt5645_components(codec_dev);
    593         snd_soc_card_chtrt5650.components = rt5645_components(codec_dev);
    594 

regards,
dan carpenter
