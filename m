Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE1162CB6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 18:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4408C1689;
	Tue, 18 Feb 2020 18:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4408C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582046844;
	bh=6DK/FocroVLPyjuI56YRMOSmLrvoS/+ZAaEtZ8mXGo0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEFG2JLdRWzadyKuk+O4e5VjqObzWakYn5vhr0M2ibiD/r507p2GXEM0zD6EkSjvi
	 FROM+uS493OI2CYMOWUH3llkKUmPFus6eMzQ+8y55CiN7qXCcc33NnsulbcHFUw09K
	 35VUDgqZedldCq/abaxKtVn2y/tU7/zoz4Hu2dnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE484F80276;
	Tue, 18 Feb 2020 18:24:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A41F8015C; Tue, 18 Feb 2020 18:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA4C8F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 18:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4C8F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 09:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="408136610"
Received: from bmerugul-mobl1.amr.corp.intel.com (HELO [10.251.159.61])
 ([10.251.159.61])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2020 09:24:27 -0800
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
To: ojab // <ojab@ojab.ru>, Mark Brown <broonie@kernel.org>
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
 <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
 <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
 <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
 <20200116145708.GQ3897@sirena.org.uk>
 <CAKzrAgQapgQtxMLYjEe9mSaXp_uYxMyH8fwvoJqM3Or0sqqfiw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <394de883-f044-44cb-9b09-a4fbe2e14b75@linux.intel.com>
Date: Tue, 18 Feb 2020 10:24:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKzrAgQapgQtxMLYjEe9mSaXp_uYxMyH8fwvoJqM3Or0sqqfiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 2/17/20 9:10 AM, ojab // wrote:
> On Thu, Jan 16, 2020 at 5:57 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Wed, Jan 15, 2020 at 07:04:48PM -0600, Pierre-Louis Bossart wrote:
>>
>>> Maybe we could have some sort of boolean flag in the component->driver
>>> definition and explicitly request a backwards-compatible behavior (e.g. for
>>> all SKL/KBL machine drivers) when that driver is known to be flaky. There's
>>> already things like 'fully_routed', maybe we can add something such as
>>> 'disable_route_check'?
>>
>> A quirk for old stuff that can't be fixed sounds like a sensible
>> solution to this.
> 
> Any update on this?

Sorry, this is what I had in mind (not even compile-tested). I don't 
know if the checks need to be disabled twice.

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..7a4643d87e39 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1058,6 +1058,7 @@ struct snd_soc_card {
         const struct snd_soc_dapm_route *of_dapm_routes;
         int num_of_dapm_routes;
         bool fully_routed;
+       bool disable_route_checks;

         /* lists of probed devices belonging to this card */
         struct list_head component_dev_list;
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c 
b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e6de3b28d840..b57f55731390 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -644,6 +644,7 @@ static struct snd_soc_card skylake_audio_card = {
         .num_dapm_routes = ARRAY_SIZE(skylake_map),
         .fully_routed = true,
         .late_probe = skylake_card_late_probe,
+       .disable_route_checks = true,
  };

  static int skylake_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c 
b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index c99c8b23e509..8f3b724fec27 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -687,6 +687,7 @@ static struct snd_soc_card skylake_audio_card = {
         .num_configs = ARRAY_SIZE(ssm4567_codec_conf),
         .fully_routed = true,
         .late_probe = skylake_card_late_probe,
+       .disable_route_checks = true,
  };

  static int skylake_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 068d809c349a..d56cb655d89c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1257,7 +1257,10 @@ static int soc_probe_component(struct 
snd_soc_card *card,
                                       component->driver->dapm_routes,
                                       component->driver->num_dapm_routes);
         if (ret < 0)
-               goto err_probe;
+               if (card->disable_route_checks)
+                       dev_info(component->dev, "Ignoring errors on 
snd_soc_dapm_add_routes\n");
+               else
+                       goto err_probe;

         /* see for_each_card_components */
         list_add(&component->card_list, &card->component_dev_list);
@@ -1939,7 +1942,10 @@ static int snd_soc_bind_card(struct snd_soc_card 
*card)
         ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
                                       card->num_dapm_routes);
         if (ret < 0)
-               goto probe_end;
+               if (card->disable_route_checks)
+                       dev_info(component->dev, "Ignoring errors on 
snd_soc_dapm_add_routes\n");
+               else
+                       goto probe_end;

         ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
                                       card->num_of_dapm_routes);
