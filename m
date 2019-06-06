Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E900537361
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 704E8167C;
	Thu,  6 Jun 2019 13:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 704E8167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559821916;
	bh=gNJHjv5UOmbkYIvWVQHApK1e/xs1AeFLLFnz6/TQA6c=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1KqsdPAVZ6MFeIVU+/NmzMeh02pIapX+UCnw9py9kDxbmuI6S4L4aLfWN3Goy9cN
	 6yjnHm4nAbuW0ZPuvdoF1LQc2BF/NA8TmbRlHSlXjzfje0XukY3pj6ZKIV0vG7ATf8
	 p792MTyFeUcMLHQnTCitjBGc995rkZ+BuCQNxUdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26619F896EF;
	Thu,  6 Jun 2019 13:50:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2539F896EF; Thu,  6 Jun 2019 13:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08F71F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F71F8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 04:50:01 -0700
X-ExtLoop1: 1
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2019 04:50:00 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.162]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 12:49:59 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Thread-Topic: [alsa-devel] [PATCH v2] ASoC: sun4i-i2s: Change SR and WSS
 computation
Thread-Index: AQHVHFf8jLmQMNr5tUuhDON+nU23VKaOfj5w
Date: Thu, 6 Jun 2019 11:49:58 +0000
Message-ID: <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900D3A0@IRSMSX104.ger.corp.intel.com>
References: <20190605100801.2488-1-maxime.ripard@bootlin.com>
 <3BD9CEE4EBD5E74B98FE2D277EB60E0B38FF8117@IRSMSX104.ger.corp.intel.com>
 <20190606110647.iojplb27mdo276xk@flea>
In-Reply-To: <20190606110647.iojplb27mdo276xk@flea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTBkYjYxMTktZGE4OS00ZDRkLWJmMDktZWUzZDcwNDg5ZTk2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNzZUSUxtK2s4XC9EWVd0TWt6SXpJeHV6YUg4UWZcL0Z4aEhBSEtaejR6MW4zZEI0NG0zaU1qRG1SSWlDV1lBN0ZMIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sun4i-i2s: Change SR and WSS
 computation
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

>Hi,
>
>On Wed, Jun 05, 2019 at 04:36:28PM +0000, Rojewski, Cezary wrote:
>> >+static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
>> >+{
>> >+	if (width < 16 || width > 24)
>> >+		return -EINVAL;
>> >+
>> >+	if (width % 4)
>> >+		return -EINVAL;
>> >+
>> >+	return (width - 16) / 4;
>> >+}
>> >+
>> >+static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
>> >+{
>> >+	if (width < 16 || width > 32)
>> >+		return -EINVAL;
>> >+
>> >+	if (width % 4)
>> >+		return -EINVAL;
>> >+
>> >+	return (width - 16) / 4;
>> >+}
>> >+
>> >+static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
>> >+{
>> >+	if (width % 4)
>> >+		return -EINVAL;
>> >+
>>
>> In the two above you start with boundary check before mod yet in
>> this one the order is reversed.  Keeping the same order should prove
>> more cohesive.
>
>Indeed, I'll fix this.
>
>>
>> >+	if (width < 8 || width > 32)
>> >+		return -EINVAL;
>> >+
>> >+	return (width - 8) / 4 + 1;
>> >+}
>> >+
>>
>> Other, probably less welcome suggestion is introduction of unified
>> function which ones listed here would simply invoke. All of these
>> "computations" differ in fact only in: min and max boundary. The +1
>> for _sr_wss is negligible, you can append it on return.
>
>It's not just about the min and max boundaries. It's also the offset
>at which to start with (16 vs 8), and the offset to apply to the
>result (0 vs 1).
>
>That's 4 parameters out of 5 that are different. For something that
>trivial, I don't think it's worth it to put it in common.
>
>Maxime

This is what was going through my mind:

static inline s8 my_unified(int width, u8 min, u8 max)
{
	if (width < min || width > max)
		return -EINVAL;

	if (width % 4)
		return -EINVAL;

	return (width - min) / 4;
}

static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
{
	return my_unified(width, 16, 24);
}

static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
{
	return my_unified(width, 16, 32);
}

static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
{
	return my_unified(width, 8, 32) + 1;
}

However, if indeed 'start' offset is variable and may differ from min boundary, then my approach would fail.
Otherwise, treat it as suggestion, personally I find it easier to update only the unified function (development phase), especially if you're planning for adding more of these (the min/ max variants) in the future.

One more thing, the i2s ptr is unused - consider flagging it or simply removing from declaration?

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
