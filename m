Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD13D752B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 14:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073821EEC;
	Tue, 27 Jul 2021 14:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073821EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627389518;
	bh=VebLZ2hv7yNTT0SPKlDsWBOGgeUW5iD8juJbDWUI/vo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLtpwuJuUs5vDJHa/THHK9Q20fH7Cl2fQq1mBXINWahAxptKxnN7Lgm7teT3RB8Hn
	 Vx6b7gNYrzOFqaWLU8z//xe/4mNOpY6YBwwfTJz5hYUUbUkziFH9CiIZ0L8qftvF85
	 OAAGxKgsVEFGo7uk9NSYO30gKepSOvUiESuj/VAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74260F80276;
	Tue, 27 Jul 2021 14:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB09F8026C; Tue, 27 Jul 2021 14:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A8AF80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 14:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A8AF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GxqXf9wS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16R4SFev022689; 
 Tue, 27 Jul 2021 07:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=30u8pmTQU7srqNMjz6DRt4uV+3lRTm4Mp+vqpkBXZC4=;
 b=GxqXf9wShv5rlSgg82glhutBzA8BXGnk1YCixCNNsaaLk4X+o49waInStplC1wKRcH+H
 OhwAYa8igZv9VnAGvc+0G7o+K8WvLu/2Szyi5JeKBFc3cEc6DOl+3lIRCVz8JWI+wbie
 2AYgvO//3dltJBfRv/AIGdmri1cpGLnDeKqqkLJw6eeKg+8knRQTEM3esX3ZoMXMwV8r
 ZquzSxA5fkTajpEeqlGK4GsTdYdKCuJW5Q3ibE/XiN3d3F/ADJfLH17Mu39KT5ZEsOeb
 Q3jjHc+QSpZ94I52kdPEKEpc188OQZ8z2CgARFBAIeGpOX3C33s2WTPFe6ek+LY4GNDs yQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a2340gx6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Jul 2021 07:36:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Jul
 2021 13:21:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 27 Jul 2021 13:21:53 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.56])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E1C22BA;
 Tue, 27 Jul 2021 12:21:53 +0000 (UTC)
Subject: Re: [PATCH 01/54] ASoC: dt-bindings: Add WM8978 Binding
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-2-maxime@cerno.tech>
 <20210723213251.GA2622319@robh.at.kernel.org>
 <20210726001713.GA8831@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <885f19af-32d5-d792-84b2-56afb8fcdf6c@opensource.cirrus.com>
Date: Tue, 27 Jul 2021 13:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726001713.GA8831@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g1gHYKLF0Lw5P5gRo3_hf33OsltMUOdM
X-Proofpoint-GUID: g1gHYKLF0Lw5P5gRo3_hf33OsltMUOdM
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270074
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On 26/07/2021 01:17, Mark Brown wrote:
> On Fri, Jul 23, 2021 at 03:32:51PM -0600, Rob Herring wrote:
>> On Wed, Jul 21, 2021 at 04:03:31PM +0200, Maxime Ripard wrote:
> 
>>> Even though we had the wm8978 driver for some time and a number of
>>> boards using it already, we never had a binding for it. Let's add it
>>> based on what the driver expects and the boards are providing.
> 
>>> +maintainers:
>>> +  - Mark Brown <broonie@kernel.org>
> 
>> No one from Wolfson cares about this device?
> 
>> Otherwise,
> 
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Well, Wolfson no longer exists since it was bought by Cirrus but copying
> in the Cirrus people to see if they want to be listed there.
> 

People, ownership, and email addresses can change. It's always best to
check MAINTAINERS to see the current support status. In this case it has
a section to pick up those Wolfson drivers, with the correct email
address. The list email will be monitored by multiple people.

WOLFSON MICROELECTRONICS DRIVERS
L:	patches@opensource.cirrus.com
S:	Supported
<SNIP>
F:	include/sound/wm????.h
<SNIP>
F:	sound/soc/codecs/wm*

