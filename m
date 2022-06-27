Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C901155B989
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 14:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A907EAE8;
	Mon, 27 Jun 2022 14:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A907EAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656333191;
	bh=QWGOcmotvFMILL3babbGUoVabuKPsNJyo5INNJZ+rd0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hywVptzIeNRezonP0UUUddemHGRtp9FdOVNKVk/6SWAublA2d/1mXezaek+b2cLxp
	 OyFEZR82DzLImb6I6HLYkr4bBvOHo7hX+FX/XYdTUqNyMNC7+HLH0qG+g9q34szGmn
	 2QxsxUkZZ0sLV0O9RrAV1eHN7/Z0G8d1uNeVRTGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243FEF80128;
	Mon, 27 Jun 2022 14:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742D3F8028B; Mon, 27 Jun 2022 14:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37982F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 14:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37982F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="fCuCijV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656333129; x=1687869129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QWGOcmotvFMILL3babbGUoVabuKPsNJyo5INNJZ+rd0=;
 b=fCuCijV/AexXrCbOppssOoi46yJo4KcL5d4pw+0cdogKqo8TD+Y7Rz08
 r2PKG1s1T8DFPzwq1FFAKlxl8q/J96aYQ724zdLNKt8B6fwoKXlYwovAL
 IzO+N8xboE7KjYGeY3S6Tbs30IwEprCTTkI6YXdpQ2s9TWrX86EvyCQ+O w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 05:32:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 05:31:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 05:31:47 -0700
Received: from [10.216.28.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 05:31:42 -0700
Message-ID: <7b532c96-e36b-207e-532c-8b41f7106831@quicinc.com>
Date: Mon, 27 Jun 2022 18:01:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v5 0/2] Add software clock gating requirement check
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
 <YrQfs7HUIOV5x8Ub@matsya>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YrQfs7HUIOV5x8Ub@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


On 6/23/2022 1:39 PM, Vinod Koul wrote:
Thanks for your time Vinod!!!
> On 10-06-22, 17:53, Srinivasa Rao Mandadapu wrote:
>> This patch set is to add software clock gating requirement check
> This fails to apply for me, please rebase on sdw-next and resend
>
> Thanks

It seems one patch is missing in your branch, which accepted by Mark brown.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=32882881078bd8f8fae47ff69c102d9e691f5bb9

