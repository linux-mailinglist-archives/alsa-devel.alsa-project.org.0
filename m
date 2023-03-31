Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B36B6D17E7
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 08:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20892200;
	Fri, 31 Mar 2023 08:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20892200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680245973;
	bh=/NRqgRmQa3NEa/+C7lJkV8xuGqZsVeyuCTQvA7UXWBo=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RxZcmfaT+GL37UVOLyyY9fO99geEW/pB5Nyvu7py7bELXAdiriSr4d7BfxccYue0d
	 Xquwn6YZFUntTjz4oHVmDEfAw+WKSbZ522XRhn2aUaYM32QE0xcTtNglw4MvMfGTAg
	 dgEc1LZ6LzBgZ6SFrPONQLzYv5uu4k/9+gSXbov0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72377F8024E;
	Fri, 31 Mar 2023 08:58:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82AFDF80272; Fri, 31 Mar 2023 08:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F265F80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 08:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F265F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LICbc1BX
Received: by mail-wm1-x330.google.com with SMTP id p34so12278757wms.3
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680245908;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hURphu3yaUCwHRirf+woLzxhdgG+CqzPEwGs59AGceE=;
        b=LICbc1BXVRdshDI/l+B5+BEJ23b19V6U2uY3gdwXPbeQL1veu3GIIa31JbXhZ1KLnk
         vMptrf7MxA06gkR64Y579FRAAxmYTlHQ4jMmrrVc6SRmJMjiTlnqhRHtRlmO+FC7ufFG
         Cx/osvfLykzQr3GbPzlNPg2K3zec2pJgPU+TAZzlSTfOot52sJFoEwGFzFENi0R7fDZy
         kJWTKxEYeYqSg8GfguwPZaOhijaTuyJkAR/oLN1ZHJQHu4OzgE4zRcK7PJHIS4BLPL0j
         bR6N11YT/crwB331hTEHzMnSwEVwFxavrBz+mBkuRhHvmkNcN7cTGpJklyYhyjsRY9qQ
         r/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680245908;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hURphu3yaUCwHRirf+woLzxhdgG+CqzPEwGs59AGceE=;
        b=k4WkeeXVlIRmV8qH6Pws16XmdggMGAVsm3ML46heM8rDyhaHyloVzXratnpWpKXyjp
         KiCEPc/wLLQg6NpG/7+6ibrQfESe2eb7AYQs1XvXqGTINlf1rmMZlcVHIytAxI8g8w3U
         N4OZhWdYW7XFWV5vdwdU5T6goJg6rSkIscdhH5veNM+QhiDK9lB8qdwXcageK/Gd56r0
         C29YiY2EWXxVH4V0dcxAHd31ktAyWL6ZTlowyaUT8IvfczgZRwFaEYocJ27bxaKULBDn
         U4JAHMAsIFkXCpWJmlVz7XGSL/j2gr0t64lYbMT/JCNCpdCIjIAtBgW+wUHHEkYV5+K2
         psxg==
X-Gm-Message-State: AAQBX9e8MO4xirmqQ3s5DqzOkKCn5sIkYch/ldidgm3uIwBYx8kqL/yz
	rCkVwkXsbm3ZCY9YUh1+ANs=
X-Google-Smtp-Source: 
 AKy350Y3gOPcZfZFupE0ijVDdiwQJr+m8XRZ96agPrkYEuOf9f4lSDKYE2llBaIIKGcpmhOyjYw4jA==
X-Received: by 2002:a05:600c:254:b0:3f0:3d47:2cc5 with SMTP id
 20-20020a05600c025400b003f03d472cc5mr2332932wmj.10.1680245907949;
        Thu, 30 Mar 2023 23:58:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 q3-20020a05600c46c300b003eddc6aa5fasm8873702wmo.39.2023.03.30.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 23:58:27 -0700 (PDT)
Date: Fri, 31 Mar 2023 09:58:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: guennadi.liakhovetski@linux.intel.com
Subject: [bug report] ASoC: SOF: avoid a NULL dereference with unsupported
 widgets
Message-ID: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: AHUXAVCK7NACFO2LMRSSTMFQWBOSK2JA
X-Message-ID-Hash: AHUXAVCK7NACFO2LMRSSTMFQWBOSK2JA
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHUXAVCK7NACFO2LMRSSTMFQWBOSK2JA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Guennadi Liakhovetski,

This is a semi-automatic email about new static checker warnings.

The patch e3720f92e023: "ASoC: SOF: avoid a NULL dereference with 
unsupported widgets" from Mar 29, 2023, leads to the following Smatch 
complaint:

sound/soc/sof/ipc4-topology.c:2353 sof_ipc4_route_setup()
error: we previously assumed 'sink_fw_module' could be null (see line 2351)

sound/soc/sof/ipc4-topology.c:2353 sof_ipc4_route_setup()
error: we previously assumed 'src_fw_module' could be null (see line 2351)

sound/soc/sof/ipc4-topology.c
  2350	
  2351		if (!src_fw_module || !sink_fw_module) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
One of these is NULL.

  2352			/* The NULL module will print as "(efault)" */
  2353			dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
  2354				src_fw_module->man4_module_entry.name,
  2355				sink_fw_module->man4_module_entry.name);
                                ^^^^^^^^^^^^^^
Both are dereferenced.  The comment is very puzzling.

regards,
dan carpenter
