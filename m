Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADDC7F61BB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:41:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A852E95;
	Thu, 23 Nov 2023 15:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A852E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700750468;
	bh=QHU5FMcR857sRc9uQd5oc5RNRAqCC/9u+zrJjqzWLAw=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UyQ3zeFRaBoASuY+gcZ2yZbuaeBEpjnP3vIFrFI7FhPBMQwu4/Py/ILrMOYGJlvKc
	 LZCbD/cuy+qil4dz/Tois5yZOgYEeBAstZH2n99tp8+8h2L8BXdYUYnCt/UWzqQz3c
	 X24/l0NjzkMGlf+C2NXmJQ3+s8EgaSGfWzN87Kf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 267A5F80634; Thu, 23 Nov 2023 15:39:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BB6F805F9;
	Thu, 23 Nov 2023 15:39:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09499F802E8; Wed, 22 Nov 2023 16:51:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6A3AF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 16:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A3AF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=myf08uUs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AMCI4cB009416;
	Wed, 22 Nov 2023 09:51:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=
	PODMain02222019; bh=0EJUDXEEx1uaj+Vpy9q/HshvrhOAKakRmd0jf8CvOjs=; b=
	myf08uUsuUbI3bRCvtMMq6/JMRVhnQqU0cndDe2xLHAtw1hcuHUGEnH99/q8Yea9
	Hb8tWJtfXpqFuQocbtaG03+OUm3T2Fh6bmhAFYvBDfdTgYcIsb38xTUPClaNNGOG
	yEGOu1t7/9NoI724SBhP1ajLkQxwQ/4R8P3LF7cboKvDQ5O5E26CXrq6K1eWJycm
	Hm+yPRBw+dqfDFIo6SsC20tFuofbYa6qALbUkVCme/hGc3V/18MdmgEkvdFtX0N2
	NTL4orfdJsRwTdc9kVPcj7cixB14AmGI6sNnFJhyLCd5W2N8ELxSI5O1Y1NR7kHz
	HF8ygyQuAJzM/R2qyJR06Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj2cp4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:51:08 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 22 Nov
 2023 15:51:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 22 Nov 2023 15:51:06 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.251.123])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4D3715B6;
	Wed, 22 Nov 2023 15:51:06 +0000 (UTC)
Message-ID: 
 <399d6e4fcbaa590bcd92869e7d02402a9226cad2.camel@opensource.cirrus.com>
Subject: Re: [PATCH v4] ASoC: cs43130: Allow driver to work without IRQ
 connection
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date: Wed, 22 Nov 2023 15:51:06 +0000
In-Reply-To: <20231122154238.GM32655@ediswmail.ad.cirrus.com>
References: <20231122143459.26861-1-mstrozek@opensource.cirrus.com>
	 <20231122154238.GM32655@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LxaKH6Si1qg48sy4WPOpafk-lSIpc2JU
X-Proofpoint-GUID: LxaKH6Si1qg48sy4WPOpafk-lSIpc2JU
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=669075e529=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: ZDFKQ2CFHXSUWFEVDKMZ6IPKSADU7CQO
X-Message-ID-Hash: ZDFKQ2CFHXSUWFEVDKMZ6IPKSADU7CQO
X-Mailman-Approved-At: Thu, 23 Nov 2023 14:39:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZDFKQ2CFHXSUWFEVDKMZ6IPKSADU7CQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W dniu śro, 22.11.2023 o godzinie 15∶42 +0000, użytkownik Charles
Keepax napisał:
> On Wed, Nov 22, 2023 at 02:34:59PM +0000, Maciej Strozek wrote:
> > Add a polling mechanism that will keep the driver operational even
> > in
> > absence of physical IRQ connection. If IRQ line is detected, the
> > driver
> > will continue working as usual, in case of missing IRQ line it will
> > fallback to the polling mechanism introduced in this change.
> > This will support users which choose not to connect an IRQ line as
> > it
> > is not critical to part's operation.
> > 
> > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > ---
> 
> Apologies Maciej, should have spotted this when I had a look this
> morning but I have just spotted one more thing, we should actually
> remove the polling for the hpload detect. The hpload detect can
> actually only be triggered by the IRQ handler anyway so that code
> will never run, and there would be much more work required to get
> the jack detect working without the IRQ.
> 
> Thanks,
> Charles

No problem, will send V5 with the hpload detect deleted tomorrow

