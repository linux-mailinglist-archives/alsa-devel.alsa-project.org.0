Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C545B522
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2F51798;
	Wed, 24 Nov 2021 08:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2F51798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738142;
	bh=e8grRUOSUWKvNjuBHzARZ87RFk6eyhxdZUIPm5pWe9g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW/xd3dzsn3ggvSVG0TTNdMP3BMbf9UjGr1FSAtCaThd1VZgCpWQCOOXP4FXjGO0G
	 v8s8kE9R58F5t94oloYZbJ6JMyd1awEUqfLSMs45xLP/zy3DGsO8iTp/n6uDG6uaBW
	 P/vsgpH+dvcp4NiwvyinI53g8s/FXHQtGpEai/4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64EC7F805D8;
	Wed, 24 Nov 2021 08:06:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FF34F8049E; Tue, 23 Nov 2021 19:03:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4471F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 19:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4471F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fYhyJHYC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7jAQ0031806;
 Tue, 23 Nov 2021 12:02:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Jx26KMJht9GZbSLMdhodk+RkXN+RoA34x0E33gX19jI=;
 b=fYhyJHYCK+IhoR9CnzIHTqLvCAi8bbkafekt9sFaGkiO/k4iOIAp0p8Js9WuDef+wEGB
 ACy8eUGbKvRd7opzFtaC/7Y/gwk01lniSVfRHpQqhIRlebZFHHBGkA3RFLU1D194w2Yt
 dh97KVFOonclatmBG/7osKfHmLaq9Cwbcr/BYlc2DRp41ZDCGVcpl0CTj6t3mnya5nbU
 feqbmaOdaZdz/ERG40qw6/psuds9GeUmy02sQ3qksU3Rqn4tRYmX/jkiYF6bcULd3wpw
 g0Hkm4/oAynx/D5TC7TINfCVGxXEX8bIXwUKtovcaMxAYiZglI2ySDSYhVNEQVQORenZ mw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms25bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 12:02:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 18:02:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 18:02:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4B49B06;
 Tue, 23 Nov 2021 18:02:53 +0000 (UTC)
Date: Tue, 23 Nov 2021 18:02:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 01/11] ASoC: cs35l41: Set the max SPI speed for the whole
 device
Message-ID: <20211123180253.GF18506@ediswmail.ad.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-2-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211123163149.1530535-2-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: QxsPUmA4dig9wQgfRRekjSQno3if7DLV
X-Proofpoint-ORIG-GUID: QxsPUmA4dig9wQgfRRekjSQno3if7DLV
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Elia Devito <eliadevito@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 Werner Sembach <wse@tuxedocomputers.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Shuming Fan <shumingf@realtek.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Sami Loone <sami@loone.fi>, Len Brown <lenb@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Cameron Berkenpas <cam@neo-zeon.de>, Jack Yu <jack.yu@realtek.com>,
 Kailang Yang <kailang@realtek.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 David Rhodes <david.rhodes@cirrus.com>
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

On Tue, Nov 23, 2021 at 04:31:39PM +0000, Lucas Tanure wrote:
> Higher speeds are only supported when PLL is enabled, but
> the current driver doesn't enable PLL outside of stream
> use cases, so better to set the lowest SPI speed accepted
> by the entire device.
> 
> Move the current frequency set to the spi sub-driver so
> the whole device can benefit from that speed.
> 
> spi-max-frequency property could be used, but ACPI systems don't
> support it, so by setting it in the spi sub-driver probe
> both Device Trees and ACPI systems are supported.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
