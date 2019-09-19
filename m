Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED7B7CDA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 16:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AABE1688;
	Thu, 19 Sep 2019 16:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AABE1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568903541;
	bh=raE76SwMH9w9qXrll75B0oXLsTnbPPrLnJlgoYeAtaI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTTyFbyyzVgUNha9EIp3nh9kcGgmZnP/YWQB8dc3Aa8xZFBiH9039erJm3FabCvIn
	 E2ijE37q6pfHZqGZqKXwlCD6a4cxETsnbDdoGUcLrhekGsMvHlltwmmu0kPyFZP0zE
	 O1QIlmEPajG47yqfck94TWid5JLM7G4mfGUXtjWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ABF8F804CF;
	Thu, 19 Sep 2019 16:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6058F80361; Thu, 19 Sep 2019 16:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDDC5F80307
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 16:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDDC5F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="J9buVC0Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JETFWh020368; Thu, 19 Sep 2019 09:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PupjcNRQ2lxRP0e4ia7WEj2POWDctVOG0nBQBB08VYk=;
 b=J9buVC0Zz24St63xLUxx42wcaPWcFSJ06NxtMhirEAqaTpZowp4vkWR5cyxEhD72qaHS
 3TC0FbJNBs9vblA8iPqYlUzVKbJbU8h3HPyGK22qQEmqOnrx5OrzgICPi8MZV9bkw7Zd
 MyF8HadxeGI/zSooHeNn7CVWfP5YJk28OpEwNECWgPcoXdswkiCGwTiRMMj9CUGyAaYt
 maRdCjfHS1q54R3kZ0p1D7Q6PEu0SjGTDTro5S8Ix5D0eCw9+dpLMOTeNz9GfBMfsLtG
 XBbcorQdVMC6a/kI7lJ2FDP/gZ1fiR35zzOGoP/5x8flkvVYRTsoVDxx8p3Ee/ehlmHo GA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2v3vbhs7sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 Sep 2019 09:31:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Sep
 2019 15:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 19 Sep 2019 15:31:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD7042C3;
 Thu, 19 Sep 2019 14:31:16 +0000 (UTC)
Date: Thu, 19 Sep 2019 14:31:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190919143116.GL10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3> <20190919125020.GJ3642@sirena.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919125020.GJ3642@sirena.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=938
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909190137
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Sep 19, 2019 at 01:50:20PM +0100, Mark Brown wrote:
> On Thu, Sep 19, 2019 at 09:59:24AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> > > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > > part of the wm8994 driver so they can be further handled in the audio
> > > CODEC part.
> 
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
> 
> Yeah.  IIRC when these were added a machine driver was grabbing them.  I
> don't think that machine driver ever made it's way upstream though.

If you mean for the Arizona stuff, the machine driver using that
was sound/soc/samsung/tm2_wm5110.c. Sylwester upstreamed it along
with the patches.

I think on wm8994 the clocks probably are only needed by the
audio part of the driver, so probably can be moved in there,
although as a disclaimer I have done a lot less with parts
of that era. However on Arizona the clocking is needed from
various parts of the driver so couldn't be moved exclusively
to the codec driver.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
