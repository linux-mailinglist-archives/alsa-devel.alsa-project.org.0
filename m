Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E351A443
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 17:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C6B015E5;
	Wed,  4 May 2022 17:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C6B015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651678817;
	bh=UrSy1G58JOS/YtxeMIS96e9nM/kXiH5KO6eC+GHGn14=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHGUvOGzcnTn1MuMG299w1O2afMqtdxmQx0/5xZNQjDVsrgqJ8ZCKshPy/3vo3PLs
	 gJW6vENUHtkuT/jKKWzqQ/6wFxigO7kcdvf0MuUROAvsYfM3KUkeCX1/fbJ+fBWjkZ
	 gdoM7oDp1N2lT24Y1nrmcZ44w1k+jNVtCGc1xMJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0050AF80166;
	Wed,  4 May 2022 17:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B438CF80163; Wed,  4 May 2022 17:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC2CF800BF
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 17:39:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 448EAA0042;
 Wed,  4 May 2022 17:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 448EAA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1651678749; bh=8y/jWRnCFB7+GM93aFIu1DxvHexdJo+76xzX46JlgyA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bbrDU2bzX68CZXeh5WktpPzq+xUuHml9pPxQa5JmRzlcwDCqRk8s1RAo/Mk12WA1o
 b46j14hTFQ7NOZus7GuBugSDkUnB2YmlMQ1H+WIg9MvD8pGIuZzrs6uGtr8EHQhT4D
 e2Y736GnE1pOtJIB2ECUdG8DkTFPCpkj6Y2MovFc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  4 May 2022 17:38:57 +0200 (CEST)
Message-ID: <2777a078-d2c7-d400-4b84-d2bf4c3e0d02@perex.cz>
Date: Wed, 4 May 2022 17:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
 <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
 <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
 <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 04. 05. 22 17:26, Pierre-Louis Bossart wrote:

> My take is that the topology should not make any hard-coded assumptions
> on the hardware connection to the codecs but be given the information
> before the topology is loaded.

The information is already coded in the topology filename, so it should be 
easy to extend the topology format to refer to the machine variables instead 
using the fixed numbers or strings. Eventually, it may be easy to 
conditionally use a blocks from the topology on demand, if the referred 
variables do not exist.

> sof-tgl-es8336-ssp0.tplg
> sof-tgl-es8336-ssp2.tplg
> 
> All these topologies come from the same file, and generated using
> macros. That makes no sense to me, this should be the same topology that
> is remapped at run-time.

Yes, it should be handled more elegantly.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
