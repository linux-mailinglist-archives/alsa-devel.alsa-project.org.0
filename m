Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F325E760B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD89984B;
	Fri, 23 Sep 2022 10:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD89984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922674;
	bh=eRoKROPrgolTsAuofVkNTgpcsXhkP1JtwlWZjMrN7oM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ako0X9/iJuyzSGIpjfe2UN9cwzUyT37YUbvBgYu1skY8D5+wmiC5+k4yWSdiYCAj8
	 Mtmx46MgmY5H4EHmWnh29vQJ7wXJlrpoSKUatA6WeFXMiUzPOE7YRaQAL8iR48AYwo
	 Uxwz+aFTV2VU4R/bebTKm3KqfvGNSxmUe1Fxtfrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1D1F8054A;
	Fri, 23 Sep 2022 10:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 799A3F80256; Wed, 21 Sep 2022 04:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=NICE_REPLY_A, RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com
 [115.236.118.83])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B84DF800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 04:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B84DF800F3
Received: from [172.16.12.74] (unknown [58.22.7.114])
 by mail-m11883.qiye.163.com (Hmail) with ESMTPA id 351DA840709;
 Wed, 21 Sep 2022 10:37:07 +0800 (CST)
Message-ID: <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
Date: Wed, 21 Sep 2022 10:37:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
To: Mark Brown <broonie@kernel.org>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
From: Jason Zhu <jason.zhu@rock-chips.com>
In-Reply-To: <Yym2aURe2+pA3ocn@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkodVkMZSR4dSB4ZGBpOTFUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Hgw*Vj0YLhMvLDVRMjAB
 PRoaCxRVSlVKTU1ITElMQ0lMTE9DVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9KSUo3Bg++
X-HM-Tid: 0a835de7f9b82eb8kusn351da840709
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: jason.zhu@rock-chips.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, sugar.zhang@rock-chips.com
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


在 2022/9/20 20:47, Mark Brown 写道:
> On Tue, Sep 20, 2022 at 11:45:45AM +0800, Jason Zhu wrote:
>
>> Sometimes we need to make some dais alive when close the card, like
>> VAD, so these functions must be exported so that they can be called.
> I'm not sure I fully understand the use case here - why wouldn't
> the core know about the audio stream being kept active?  For
> something like VAD I'd expect this to be just working like a
> normal audio path, if there's a DSP consuming the audio stream
> then it'll keep everything open.  If there is a good use case I
> suspect it'll be clearer if you send the users along with this
> patch.

Thanks. For example, we use the VAD(Voice Activity Detect) & PDM(
Pulse Density Modulation) to record sound>. The PDM is used to
record and copy data to DDR memory by DMA when the system is alive.
The VAD is used to detect voice from PDM and copy data to sram
(The sram is small) when the system is sleep. If the VAD detect
specific sound, wake up the system and continue to record sound.
The data can not be lost in this process. So we attach VAD & PDM
in the same card, then close the card and wake up VAD & PDM again
when the system is goto sleep. Like these code:
vad-sound {
	...
	rockchip,cpu = <&pdm0>;
	rockchip,codec = <&es7202>, <&vad>;
	...
};

static int rockchip_vad_enable_cpudai(struct rockchip_vad *vad)
{
	struct snd_soc_dai *cpu_dai;
	struct snd_pcm_substream *substream;
	int ret = 0;

	cpu_dai = vad->cpu_dai;
	substream = vad->substream;

	if (!cpu_dai || !substream)
		return 0;

	pm_runtime_get_sync(cpu_dai->dev);

	if (cpu_dai->driver->ops && cpu_dai->driver->ops->trigger) {
		ret = cpu_dai->driver->ops->startup(substream,
					    cpu_dai);

		ret = cpu_dai->driver->ops->trigger(substream,
						    SNDRV_PCM_TRIGGER_START,
						    cpu_dai);
	}

	return ret;
}
When the system is waked up, open the sound card. The data in sram
is copied firstly and close the vad. Then use the DMA to move data
to DDR memory from PDM.

Now we prefer to use framework code, like:
static int rockchip_vad_enable_cpudai(struct rockchip_vad *vad)
{
	struct snd_soc_dai *cpu_dai;
	struct snd_pcm_substream *substream;
	int ret = 0;

	cpu_dai = vad->cpu_dai;
	substream = vad->substream;

	if (!cpu_dai || !substream)
		return 0;

	pm_runtime_get_sync(cpu_dai->dev);

	ret = snd_soc_dai_startup(cpu_dai, substream);
	ret |= snd_soc_pcm_dai_prepare(substream);
	ret |= snd_soc_pcm_dai_trigger(substream, SNDRV_PCM_TRIGGER_START);

	return ret;
}
In this situation, those symbols must be exported.
Look forward to your reply and suggestions.

