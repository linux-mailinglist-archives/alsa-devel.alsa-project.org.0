Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2294161136
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 12:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153BE1612;
	Mon, 17 Feb 2020 12:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153BE1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581939450;
	bh=oAlueIhTeXSpGD1S9/RMDvauflHzQ3Y8SPUfDOKkWKI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPdocx3JeXhOEZvFBl3FlnH2aeYs8XFs04ZA+w8Jh51M9tV0o9qDaKJmdz6bIXaN0
	 PsBBqj8ToH7iR9i2omW9aO5AaXekl0HFGlEoPuCO/pxwKh9rmjmQrtMcNACNheaMSV
	 CZ+oGnR+x0ECf795bBW1ZT2lfT1UiZfOfPFVSQwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5CBF800B6;
	Mon, 17 Feb 2020 12:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D082CF80172; Mon, 17 Feb 2020 12:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16160F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 12:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16160F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g0exFTp3"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HBT5oK016407; Mon, 17 Feb 2020 05:35:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=zaubdcHg3UhCydRB9gM2zUhCPiDW1lbBnAq5mzB6aFQ=;
 b=g0exFTp3nCI2xWGnMqnNrCTSdL74v26gDGmEOqX2C9dbgLzhZVvIUDAHh6+WqDLZHp7L
 jhWCQHuVDEsbD6wFIR50HK6idAcRsknD9eRoR1N2JKXdfi9qTeKKFsHo45qFAe9row7x
 5bvUCcNcvV3NUl8IX7wWri/B0m1EKj8LM15WsN00lJ/bhS5GCq7OZTnoAIzufFGeiRU9
 l9H/jfRq5WjxX9ML60Z3pukFhWNUVWPDhXWpyO8WI8Xf7P3PN28c2DCWmlVdo/ov5Aa4
 DGML9PMf22Mhry78+HQUgQths2bBNyyk4tLXvBE7biV9QEo02WFH+mDefF+p2ctxNk87 DA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ausex01.ad.cirrus.com ([141.131.3.19])
 by mx0b-001ae601.pphosted.com with ESMTP id 2y6dxw2g1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Feb 2020 05:35:41 -0600
Received: from ausex01.ad.cirrus.com (141.131.37.95) by ausex01.ad.cirrus.com
 (141.131.37.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 17 Feb
 2020 05:35:40 -0600
Received: from ediswmail.ad.cirrus.com (141.131.38.212) by
 ausex01.ad.cirrus.com (141.131.37.95) with Microsoft SMTP Server id
 15.1.1591.10 via Frontend Transport; Mon, 17 Feb 2020 05:35:40 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 259C42AB;
 Mon, 17 Feb 2020 11:35:40 +0000 (UTC)
Date: Mon, 17 Feb 2020 11:35:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20200217113540.GB108283@ediswmail.ad.cirrus.com>
References: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
 <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=911 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170099
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] DMARC & gmail & cirrus.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 17, 2020 at 10:33:55AM +0100, Lars-Peter Clausen wrote:
> On 2/17/20 9:46 AM, Jaroslav Kysela wrote:
> >=A0=A0=A0=A0I can enable the "Replace the From: header address" in the
> >mailman config to "Munge From" like in the above example, but it
> >will mean that From: will be altered (see the explanation).
> =

> The way I understand the option to replace the From: header is that
> it will only happen for those that have a reject policy, for
> everybody else nothing changes. So if the mailinglist is supposed to
> stay useful for those with a reject policy the only option is to
> rewrite the from header for them.
> =


Rewriting seems like the best option really, I doubt there
is much chance of me managing to get the IS guys to change
cirrus.com's DMARC policy and I guess we might not be the only
people who cause trouble on this front.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
