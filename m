Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F8548313
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED13181C;
	Mon, 13 Jun 2022 11:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED13181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655112018;
	bh=av/xFtyGo77hWht3BvD8WMWvq76z4evsglB9CuWMHxI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1B6SMQ/y+Hv9QzyojXvMCiXLUBAvfl1+fuGgduXWhqE8VUT1ORqn/yhbPrtDJ5KL
	 IKYQR4Tr7BJR5HklZo0c2WmbWBzsuzEjL/OnYnjrgaW7/KbaUdFt7bcK2iukzbeW9B
	 b1Ynb8rUgpKW90AlzxXjgur+pODTJy4R6ykg8FbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17756F804CC;
	Mon, 13 Jun 2022 11:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8D56F804C1; Mon, 13 Jun 2022 11:19:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0E9F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0E9F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Zq3m3+6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655111956; x=1686647956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Rbm5thygbWWefU+4Ju3dMFUcjhR/h/QPLN3Eqrm7vno=;
 b=Zq3m3+6rgrvYfXdy0Q/PXYnsVNyIAoy48IMThy6EDtAQbt9zyorol3aD
 U46Ijia/HaeNAglSUPBOVRtQWrp0DLwXI7uCENEllxs6bEnkfSagv66mA
 8sDUcD6AuJDlodJ0OWrQTdzB6H/73UUX4zfcyl3QGijY6MwebAIrjzmzJ Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jun 2022 02:19:11 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:19:11 -0700
Received: from [10.50.55.236] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 13 Jun
 2022 02:19:08 -0700
Message-ID: <6b665002-b68e-5392-a7ff-908a1c853663@quicinc.com>
Date: Mon, 13 Jun 2022 14:49:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <cover.1653813866.git.quic_rbankapu@quicinc.com>
 <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
 <8735gsznnt.wl-tiwai@suse.de>
 <f3a25238-fcc6-2381-e329-0bd80a3632a5@quicinc.com>
 <874k0tnjkw.wl-tiwai@suse.de>
From: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>
In-Reply-To: <874k0tnjkw.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Liam
 Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Krishna Jha <quic_kkishorj@quicinc.com>
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

Hi Takashi

v2 patch looks fine. Can we use this patch to submit to android common 
kernel? There is code freeze for KMI on june 17.

Please share your opinion.


Thanks

Raghu Bankapur

On 6/10/2022 11:31 AM, Takashi Iwai wrote:
> On Thu, 09 Jun 2022 20:16:52 +0200,
> Raghu Ballappa Bankapur wrote:
>>
>> Hi Takashi
>>
>> Our implementation also falls inline with your approach  [PATCH RFC] ALSA:
>> control: Use xarray for faster lookups (kernel.org), but you approach looks to
>> be clean with xarray.
>>
>> is it possible to upstream those changes?
> I submitted a v2 patch, please check it out.
>
>
> thanks,
>
> Takashi
