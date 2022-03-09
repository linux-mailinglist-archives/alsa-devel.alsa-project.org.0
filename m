Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6F4D2C43
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9102E1749;
	Wed,  9 Mar 2022 10:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9102E1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646818682;
	bh=nSNUO0weegLPp7UB3ftbxYRPYz+R83OGeYypx40qC8k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tzay7ENT3wQyS+OtFHvAu8eOgM0uNOsMOUs6UTYEhs1eyB/kLpc3CirGuhReiny5k
	 nHopHlsOJfGQvezAvwj4pTlFVZhCZXe8OkGQGL689fivEAa3CMMcWfq7XICEwJ+QqN
	 Ch0BZRFky5eNb78aFaKDNz8pAH70gOTb76yNcySk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C1BF80236;
	Wed,  9 Mar 2022 10:36:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A27ABF8012F; Wed,  9 Mar 2022 10:36:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87377F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87377F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HeTr03wE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2298h6MX031941;
 Wed, 9 Mar 2022 03:36:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/InPwi8jAKZ+siM2hnnrk2bIAROnKidpBMLsmg6Eass=;
 b=HeTr03wE90HGdUTB9YcKuUKkfu/6m1NooQt9gMGQC2S3uQO+sPak1YgfUoY/wh3kac14
 m1rVSZUv8xp42c2mt9xDXZXOG1hTSB2u8GQWzNyvdyEGtNuiCdELnTZmtui2IIoC+nPA
 wDsUJR8qrMK9hwO1B+qqT4hbpi924qFeORmQZ1J0Vgl15V9/RKAPbnY3rQV1W+NE+Iso
 1YecifcopQo29D74eWDj1jYm7zu+pgzbCi6WUf3ifiZkgCAU4RzaOu+ruCr4P966XhPD
 Wu8KR2ST8Pf2pDvabg2NNWroP1xX7GqLOXu/mH8Bw0ZpPPXCPRQuYka3+etKCoiPfJ9z cA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656negp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Mar 2022 03:36:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 09:36:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 9 Mar 2022 09:36:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 56B2446C;
 Wed,  9 Mar 2022 09:36:42 +0000 (UTC)
Date: Wed, 9 Mar 2022 09:36:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v3 16/16] ASoC: cs35l41: Support external boost
Message-ID: <20220309093642.GH38351@ediswmail.ad.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-17-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220308171730.454587-17-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: jOGKrTjWPG07-Pl5HHQCB9c0mOLhvKCQ
X-Proofpoint-GUID: jOGKrTjWPG07-Pl5HHQCB9c0mOLhvKCQ
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Mar 08, 2022 at 05:17:30PM +0000, Lucas Tanure wrote:
> Add support for external boost voltage, where GPIO1 must control a
> switch to isolate CS35L41 from the external Boost Voltage
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
