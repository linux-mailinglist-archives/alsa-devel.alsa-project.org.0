Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6D5BA6A3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE481943;
	Fri, 16 Sep 2022 08:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE481943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663308839;
	bh=rlQihhnlHAXPLOV1l54JAu5on0hGcdSyCn+932T0GCM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiBHYy2P4ICV4V51+7pd1YS11evPNpwcmfwXsNcRw5n/t3hMyjKmO1lytuVWFykH+
	 OavL0IDU1SB98U4WzTRjo1on+ybdJ4xrWSDP6x/IyPKL8SFi0xHd5xMAs1tZjtk5uQ
	 Bpdk+X25THpeEYOe+92TK/qRWE056/uBahmaZs8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019DFF8024C;
	Fri, 16 Sep 2022 08:13:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C20F8019B; Fri, 16 Sep 2022 08:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F29F800E5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F29F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="YLfZ5kOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663308778;
 x=1694844778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S5x0x7UUtUYuVN1cMny0uR6/3NIHd1+hOxAtF6G9fNc=;
 b=YLfZ5kOvpdowvmo5eLElPdrVWYMfoOCZCy0Oa+4ZOGsEBJ+1Q3BwwUNI
 /hqiKLo6/UZhcwsk2j09QJBOPgr7wl96LX9wpr0SEFMV9tTBqTyUgFuYd
 l0jXJOxBeeUX9Y6o4n8CRQAIRm3/TcCIvv/PeU1zhS/PsypMWtziou796
 vTRgtTl771dn3S09vbZ9AQo5JcWiVXKHMCNOTglMIJ27kpTkoAHwJ4F+G
 jAsc5xDFSL6NxxJAVIpQPskkcBh6gs8uJssSO9z/PFhu9U1pZpp1CUHFJ
 3rS8r9pB5aw/RXQFtTSreVf/3060QZ5EayDbXUkMZXQcIek6HymeY26Xt Q==;
Message-ID: <b9fa80d7-7fd0-83f1-cf4f-615d1afebbe6@axis.com>
Date: Fri, 16 Sep 2022 08:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ASoC: fsl_spdif: add ALSA event on dpll locked
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Robert Rosengren
 <Robert.Rosengren@axis.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo
 Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20220908133319.2149486-1-robert.rosengren@axis.com>
 <11545c65-cd49-9556-13c6-67d0ce5816c3@perex.cz>
From: Robert Rosengren <robertr@axis.com>
In-Reply-To: <11545c65-cd49-9556-13c6-67d0ce5816c3@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail01w.axis.com
 (10.20.40.7)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, kernel <kernel@axis.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>
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

Hi,

On 9/9/22 10:27, Jaroslav Kysela wrote:
>
> I would cache the pointer to snd_kcontrol structure in spdif_priv. 
> This lookup
> is expensive for the interrupt routine in my eyes.
>
>                                         Jaroslav
Thanks! Sorry for a bit late answer, but re-worked solution submitted 
few days ago where caching as you suggest is implemented.

Best regards,
Robert
