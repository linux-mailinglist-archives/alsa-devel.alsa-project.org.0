Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F16C6BA5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:55:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EC7ECD;
	Thu, 23 Mar 2023 15:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EC7ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679583355;
	bh=/jeA5Jt8G2DqLNSQGfU2EB2D0objIv0MFbrfIGmrT4o=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qdp3m0wiGaM/GSXH5X8B7Yg6adP/2zXPtdjr4IEVDmK7u+jV/uli0Rki7qi4XZ0VR
	 a7ndu5mg/xX/pQmmvwQyXK26xIztXTxXP7NHbs81Efo7TuconpJFuSUEBpdxo4LLBQ
	 WJP+Bf8i9yCykcImTk8I+LUCJmg1+m58BLc3Vx68=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3F0F8027B;
	Thu, 23 Mar 2023 15:55:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA93F802E8; Thu, 23 Mar 2023 15:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44F3AF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F3AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Th+8LMcG
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so1290455wmq.2
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679583295;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6aVynE3tzKOe+EPhG8xR2UfB9e2rvt1+UB40cAUBf0=;
        b=Th+8LMcGMoWGV2bK2jbl+mT/x0IvVvYVSG/ygQgFu6Q3In0+t1fexwGqgy0Ke7pdYh
         f94Wd8Pw9NXSNt550f3xNVje7sYSX9WNWEwH6Bq1z+fm11JwAte3IJhOXTgjfL+4KzIi
         kPvEzwdFUaIsrCsLdy3KTrxzOYwq3VvAGCgMI2L00unnGOlpFVtVDvyynMOuA1TeF3pt
         uDI6EwCy/Pm+brI+xkHB7Yv6tfSlH3Lskd/nx5Q0/dMo3705DD4mfWxQ+95fdb9cY0Jx
         RM4LfkfBJO/4c7B+k46aLAR2y2s7n5mQ1veV3IgaxRsEtMM/4T7ITdXo7M/Xuj6lq/X2
         RtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583295;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6aVynE3tzKOe+EPhG8xR2UfB9e2rvt1+UB40cAUBf0=;
        b=zyqh4jPwc/Ha2zb6xtHUNkCx3N7NvDMOVIWuwC8F2TuP4vGUezTw+4dbMkZcYtgTCB
         BkM1i7l69AD6AjuFPJBYBjL6daL5RKS9TSFoKF3/Gsl8Kyz/FNVymFlkiOdVA+qsx16M
         n9ax0tpNBacV6pMJLuY8Rg+5jjjqdvGHVXjeVd56ERU/jXXcCXPVXrJEDlvSIpA/HyKn
         6iI+jmdr1yPBGWRfzBWU9QUjTVnOhBQO9nRm44e8q0b7vcRERVfEPWoUY0B8jgmedAV+
         dNcaZJM0DDsTUdnU8rgFafQC/jSWhsJHBiQSEuuVeuZ0qR2+g8jwQBqgNXsAZOsDhIE2
         n3Zw==
X-Gm-Message-State: AO0yUKXlTJiOm5y1JApH283WMSFYmbmo2UmPO/pBonp81DFMkhVQ7Pbj
	xvnf+4rZoouVfIYOsLhB/Vk=
X-Google-Smtp-Source: 
 AK7set/8jmJuusKCQhoBcly1Tq47qNCZOmH5Ckd2yJUO8QhiPZIoNHqciMNXXa93j67Yrfd+p3lNYQ==
X-Received: by 2002:a1c:4c1a:0:b0:3ea:f6c4:305e with SMTP id
 z26-20020a1c4c1a000000b003eaf6c4305emr2491863wmf.38.1679583295377;
        Thu, 23 Mar 2023 07:54:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003db0bb81b6asm2141400wmj.1.2023.03.23.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:54:54 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:54:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: srinivas.kandagatla@linaro.org
Subject: [bug report] ASoC: qcom: audioreach: fix ADSP ready check
Message-ID: <ceb17cc7-11cd-496f-944e-c9d3ddb14b9e@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 2LDM3KYLICDWSIAETBIZ7ACBGZ4WCC7I
X-Message-ID-Hash: 2LDM3KYLICDWSIAETBIZ7ACBGZ4WCC7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LDM3KYLICDWSIAETBIZ7ACBGZ4WCC7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Srinivas Kandagatla,

The patch dd33c2e7b21d: "ASoC: qcom: audioreach: fix ADSP ready
check" from Feb 9, 2023, leads to the following Smatch static checker
warning:

	sound/soc/qcom/qdsp6/q6apm.c:167 q6apm_is_adsp_ready()
	warn: signedness bug returning '(-12)'

sound/soc/qcom/qdsp6/q6apm.c
    164 bool q6apm_is_adsp_ready(void)
    165 {
    166         if (g_apm)
--> 167                 return q6apm_get_apm_state(g_apm);
                               ^^^^^^^^^^^^^^^^^^^
This can return negative error codes on allocation failure.

    168 
    169         return false;
    170 }

regards,
dan carpenter
