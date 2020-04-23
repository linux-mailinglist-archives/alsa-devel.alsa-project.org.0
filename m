Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0C1B5A5E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D76169D;
	Thu, 23 Apr 2020 13:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D76169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587640886;
	bh=sri9IYMkopY6DPoIr/HiJgBN6mFuopSj31qNb4g8J98=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DG/yABDxog33AFoJtDxH8frW6+zgLgyp/dS/GhosOXhgPrd3IqSIZy6jT1h8KS1Wb
	 kC4m7BIL1RN0gcrIVYF9pjFfu0qkkI36U5vBgw1qflEvk8Kt6AoNRqLLn2psVHCtlM
	 ulpqmKtthxHs26d7Bn3YlV39JAJHMgl9yCgcAp9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B27CCF800F2;
	Thu, 23 Apr 2020 13:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14891F801EC; Thu, 23 Apr 2020 13:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1A83F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:19:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 13189A003F;
 Thu, 23 Apr 2020 13:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 13189A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587640777; bh=xl8vr1xDiKloN1yoSVHvSVnEH7dEy1wDjc7uT9RQxio=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nFeCibnJjuiG7olCKKMn0gbroFrGAq3zSSqcBn04MLPf6UEVeptd+7rHRPh8n7tZT
 PihOARdOzfco8S9QyYgXyfABB2+T88oY2t1b7oHg+n/9Sd0u61rN3wn8tG2kCI96bS
 7xMVJCgpcxSOPDS044Fq17qwoE5GLoK7Gm6knxWU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 23 Apr 2020 13:19:31 +0200 (CEST)
Subject: Re: ASoC driver names
To: Mark Brown <broonie@kernel.org>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
Date: Thu, 23 Apr 2020 13:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423110437.GF4808@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 23. 04. 20 v 13:04 Mark Brown napsal(a):
> On Wed, Apr 22, 2020 at 07:04:36PM +0200, Jaroslav Kysela wrote:
> 
>>    I am fighting actually with the ASoC driver names. The current situation,
>> where each hardware variant (card name) is mapped to the driver name is not
>> very practical (and not correct). The driver name should describe the common
>> part (usually the controller - like 'HDA-Intel' or bus 'USB-Audio').
> 
> With ASoC systems there is no clear controller - you've got a bunch of
> different components, usually connected by separate buses, and it's not
> super obvious what if anything should be the singular name that gets
> picked for some grouping of devices.  The whole point of the subsystem
> is to glue a bunch of independent devices together, we've generally
> picked that glue as the driver name.

I refer mostly the top-level code which creates and registers the ASoC card structure.
So it seems the platform name for many ASoC drivers should be there.

>>    I am talking about the situation, where the ASoC card name is set via the
>> device tree (snd_soc_of_parse_card_name) like in [1], but the change may be
>> considered for other drivers like Intel SST:
> 
>> Card driver name: Lenovo-YOGA-C63
>> Card name: Lenovo-YOGA-C630-13Q50
>> Card long name: LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216
> 
>>    My question is, can we change / add the more apropriate driver names
>> conditionally with a new kernel CONFIG option? Will you accept this change?
> 
> Without knowing what you're actually proposing it's hard to know, and
> there is the risk of userspace breakage here when you change things
> people are relying on.

I propose to set the snd_soc_card->driver_name to something more driver
(not card name) related like:

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index b2de65c7f95c..f6adc5a05eeb 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -557,6 +557,9 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
        card->dapm_widgets = sdm845_snd_widgets;
        card->num_dapm_widgets = ARRAY_SIZE(sdm845_snd_widgets);
        card->dev = dev;
+#ifdef CONFIG_SND_SOC_DRIVER_NAMES
+       card->driver_name = "SDM845";
+#endif
        dev_set_drvdata(dev, card);
        ret = qcom_snd_parse_of(card);
        if (ret) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 843b8b1c89d4..fdf2c4a12e52 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2246,6 +2246,14 @@ int snd_soc_register_card(struct snd_soc_card *card)
        if (!card->name || !card->dev)
                return -EINVAL;
 
+#ifdef CONFIG_SND_SOC_DRIVER_NAMES
+       if (!card->driver_name) {
+               dev_warn(card->dev,
+                        "ASoC: Card driver does not set the driver name\n");
+               return -EINVAL;
+       }
+#endif
+
        dev_set_drvdata(card->dev, card);
 
        INIT_LIST_HEAD(&card->widgets);

>>    The goal is to group the related UCM2 configurations and do the required
>> split inside the UCM2 top-level configuration file based on card components
>> string or other card identificators (related to the driver).
> 
> This sounds like you either want some enumeration of the card components
> or perhaps you're looking for some for some indication of the reference
> design that an individual board is based off so you can have a generic
> configuration for that reference design and then override bits of it?

I'd like to group the related configuration files and it seems that the driver
name field in the CTL info structure is misused (duplicate information).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
