Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6766DDF2
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC5467AE;
	Tue, 17 Jan 2023 13:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC5467AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673959535;
	bh=LYt9Zjh3U1vSbk/jnAFB5FURBSw9E3xiD1G2Qih/3yI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DM8XrTUPFd5TTLbQ8BN9y75cjtlO3KJkJrLY7H+ij2ZAz3UiFOP74P52Xyt772WW3
	 4z3MSRU1Od7cMJmi/UDZvq12e4UtTAsx8ymaN+lGZtgLphxad6fjbcOEntV5OGuvIX
	 WqxFIKrndNbFyJLA5GShxYRBdSoYyS5HUpStyuSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FB7F8023A;
	Tue, 17 Jan 2023 13:44:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB3ECF804DE; Tue, 17 Jan 2023 13:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDF1AF8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:44:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF1AF8022D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=GisC5/yj
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 57C156602D91;
 Tue, 17 Jan 2023 12:44:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673959478;
 bh=LYt9Zjh3U1vSbk/jnAFB5FURBSw9E3xiD1G2Qih/3yI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GisC5/yjQ4g/R3OCu3f1HMt9qNULbOYPux+knYi8oLrnU6yqOay59cK6UW0CXUe58
 dr3q/LZiJxcGrF14mkUIjva+WlPB7URi+l6u+gGOXesYo3ayCDdPdliN1UZjIm3s2v
 qMwRv1NGBkyRtjh0VLcyH6qTRSsyE4nk9oO5jmiVlhQbls1uwH2fBRhyD8iVbMuM4w
 8E2dxZk2JK+EuVZhLZvk53NlezEmkDVWReGmGDu1Or0h4R8SkmTlMp5MEd47M8Nb+V
 5cfjXNKJkR0P3rXZRpBee18SLKPCeh2S+83Znyn61lZsj/lHwzU0IFQh6DCRn+ePTh
 JXsVwUPUNnuDQ==
Message-ID: <1e2913ab-b796-f839-0383-d1fba6abf410@collabora.com>
Date: Tue, 17 Jan 2023 13:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] ASoC: SOF: sof-audio: skip prepare/unprepare if
 swidget is NULL
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
 <20230116125506.27989-3-peter.ujfalusi@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230116125506.27989-3-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 16/01/23 13:55, Peter Ujfalusi ha scritto:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Skip preparing/unpreparing widgets if the swidget pointer is NULL. This
> will be true in the case of virtual widgets in topology that were added
> for reusing the legacy HDA machine driver with SOF.
> 
> Fixes: 9862dcf70245 ("ASoC: SOF: don't unprepare widget used other pipelines")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[Angelo: Tested on MT8195 Tomato Chromebook]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

