Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EEC7A0367
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 14:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0462846;
	Thu, 14 Sep 2023 14:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0462846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694693480;
	bh=O3cOg1o0UjljsB/K3rkKLxqO8cs6l6qg/dkRiVCSYIE=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DEt+3NRbjSlnFEjnivh8DgCdqdRHBOgfhA2meOUHtKUgaHpeRqqdMM5z4OXBXhGsP
	 ivx1Q5PDxCydsDEVijUI25dHBnKXYhLHw5k9VAsORPFGVaajCAh1V/tHyBNY9/AbG2
	 N6V0mUxYXTitxWKShWE+Gzf1UyzAbXU4epkx/vIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3D64F80425; Thu, 14 Sep 2023 14:09:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 913A0F80246;
	Thu, 14 Sep 2023 14:09:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D1B9F80141; Thu, 14 Sep 2023 14:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9194F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 13:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9194F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=m6M7ZriJ
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-500c7796d8eso1491408e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Sep 2023 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694692775; x=1695297575;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O3cOg1o0UjljsB/K3rkKLxqO8cs6l6qg/dkRiVCSYIE=;
        b=m6M7ZriJePoVQ9UGETgH4b/q1v93kMvXqYK1Uc+BY8PcyHWpzU0rL2xBp2ks3vpgZv
         qB6jpeo687h3Xzlwz1lh56RBPA7BYd6NXd8C3ykY2DO85MkZy2ylQfwxpdvIowXM1ybx
         oiFXd0BSvQOyKdnjCgujXLriMxDL8HZ7Xikil+vHYiIkAvYpAsspnmurmf0gldPI3CTN
         T5m0ERUJl5ppIhyXPpSeWkG7ku+sf3Y8UyyjCOhL79ZgA9Rr5JzR8+uqfXIhf7XqnM0V
         nAme3180u2WhL/05J3juCTjlN3lCjhqRaOthxr07C4zG3896Il8UJtK4KfE+ShEsOzAr
         o35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694692775; x=1695297575;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3cOg1o0UjljsB/K3rkKLxqO8cs6l6qg/dkRiVCSYIE=;
        b=mY+S0aDIx+NDo/qNC6fHDlDoj6gkTWPQYWs2SXL+C7GWOKGEjzwtKn3ygONDQEuPZT
         Y+IkwhJoWjui67covwen3y+T1X+cZKBZpJ1F083mT1UR2MLzRkvpWEl8Qj2Xhs4lzifB
         3IaWFNXh7ngFfO0GtFQ0+Yt4zNqe06UR+VoDf2+96CAsv3ZzOnRDMtQ1HOq7NtZIfIPD
         VnOqCjtMCe8EOqwqaX6HRjCdgQA3SQWCFdJLD7R/JaIntYEyIxND5OAWLbDc/UX6rsDp
         FCikUCAH0osiD6FcJgPRNKEeHePb15oxZUhZ8HrOa8m2ahOk10fN1oK4NOx713Kvjqwq
         dyyg==
X-Gm-Message-State: AOJu0YzL46U9VXCvBtRrdXD7/IHQ4O83bWP+5IYKXRAPBO+JGi+xOUA0
	KKWWbtcx4U/fYHL7/TGn2ZNCadt/OxhAVvfdHcpERfxWZzXvuA==
X-Google-Smtp-Source: 
 AGHT+IEAr/K0dPutYeM2btq5X5P6U/+/t8ZmXNbCguVhUj1A0wc1hnBbEoRj4KxyoAGycO5R0htt4FYb88dNA+XB2Nc=
X-Received: by 2002:ac2:4e13:0:b0:500:7efe:313c with SMTP id
 e19-20020ac24e13000000b005007efe313cmr5749621lfr.24.1694692775279; Thu, 14
 Sep 2023 04:59:35 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 14 Sep 2023 14:59:23 +0300
Message-ID: 
 <CAEnQRZAHXy7U4Y=J1wyktA5O6CJB+6M-BBD6O=yjTgPcbjHLkw@mail.gmail.com>
Subject: Why is there no SND_SOC_DAIFMT_TDM bit?
To: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JMTF67MFT6H6NT3MIWIBJLUEDJOCPSTV
X-Message-ID-Hash: JMTF67MFT6H6NT3MIWIBJLUEDJOCPSTV
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMTF67MFT6H6NT3MIWIBJLUEDJOCPSTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I wonder why there is no SND_SOC_DAIFMT_TDM format although there
actual codecs supporting TDM.

Most of the drivers I see use SND_SOC_DAIFMT_DSP_A or SND_SOC_DAIFMT_DSP_B
to signal that the format used is TDM.
