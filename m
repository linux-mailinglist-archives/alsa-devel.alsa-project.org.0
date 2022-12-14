Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8064C9CD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6580B2421;
	Wed, 14 Dec 2022 14:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6580B2421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671023478;
	bh=qMvxfW3VoVycWP+pjsTB+rZkH9LRbbH1O7YASqUu3k4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g4k0BzM+d2jr7eUkcFSpqOSKp503ic3KSeZPEdBU52X9EvObal4ku1Hz+GPqUhrGQ
	 7tu57pKyIJAah78Q8oMWW3+F6HPOyAfxcLMF1TJ5gRy7Y57Z2tVLCT7VPKuBwiP/zF
	 TxSjKPhQlF70grHvI/irojUqVZnP0fyN2VYJvDIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26934F804D7;
	Wed, 14 Dec 2022 14:10:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E124BF804D7; Wed, 14 Dec 2022 14:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C976AF80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C976AF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OnEhJX3L
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEAosGP030155; Wed, 14 Dec 2022 07:10:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=uqTM1X1FgdfVNHTySLwZxLVD1Clcyid2R85NS87Xe08=;
 b=OnEhJX3LRlKcfOVP9tmTc8nhffaYoPXsU5e9ykqT72GXzu7qsy2ojgMIxQAwMQII2r2w
 iPz+2n4jbbr1hOJeMwftf3Ik4xs25iyE+C6B/hJ2fmNcpLdVfA9ukb4omyG4jjV1iKMg
 XQvmh0/2XDbrQKRkERoLaOl/ob90KwdeiMext1H1Bpp2nj422t7um9IVGMxVE/wht9Ht
 4dAPzA7O26bZUZf3WacQFacKEJnXMMHzJnJU+yhHgI5GJg6Svn/Ho/RqZ+vUReaJhEMw
 jAD7SmEpfAHs1FOtPRsqTaWHD+ddc+Xm4f/+PKhD9+2aS/GJX+jjGRnUhfAq53ah6dp5 jA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3mf6rh8dhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 07:10:16 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 14 Dec
 2022 07:10:14 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 14 Dec 2022 07:10:14 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D61711CB;
 Wed, 14 Dec 2022 13:10:14 +0000 (UTC)
Date: Wed, 14 Dec 2022 13:10:14 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 4/4] ASoC: wm8940: Read chip ID when wm8940 codec probing
Message-ID: <20221214131014.GO105268@ediswmail.ad.cirrus.com>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221214123743.3713843-5-lukma@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: cMSJ_BuhSNqGoxW1BWcSdrrFv3uT8ncy
X-Proofpoint-GUID: cMSJ_BuhSNqGoxW1BWcSdrrFv3uT8ncy
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 14, 2022 at 01:37:43PM +0100, Lukasz Majewski wrote:
> The wm8940 provides the chip ID information via I2C. In this
> patch this information is read and if not matching expected
> value, the probe function is aborted.
> 
> This prevents from using (i.e. inserting) other wm89* modules
> which use the sam I2C bus address.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
