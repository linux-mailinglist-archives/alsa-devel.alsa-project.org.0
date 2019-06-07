Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEDF3967D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 22:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DB01664;
	Fri,  7 Jun 2019 22:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DB01664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559938240;
	bh=AkPgUEc/eMdREhbHHVBFnGwP//8QsA054v3YBUzOKTc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YlZjyaHrgrepmTGl762tpjPgQqiIuevqtEFAk6op8f2Y+tDgeVruwF1z5H32sEX2M
	 rmF7O2LsVAeQ5VCMZ+itH9vaxe1GUIYhypMPf/2eHLy/zXbvzSZJdHf1wu3n5ohRvi
	 DE/qZ/8RdBewpFN8K9smXcsNbKfQfvepb/L/Kwfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11EDEF896CE;
	Fri,  7 Jun 2019 22:08:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1EF2F80709; Fri,  7 Jun 2019 22:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F63F80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 22:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F63F80709
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 13:08:47 -0700
X-ExtLoop1: 1
Received: from sbreyer-mobl.amr.corp.intel.com (HELO [10.252.201.95])
 ([10.252.201.95])
 by orsmga004.jf.intel.com with ESMTP; 07 Jun 2019 13:08:45 -0700
To: Mark Brown <broonie@kernel.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
References: <5cef9f66.1c69fb81.39f30.21e8@mx.google.com>
 <s5hr28gszvj.wl-tiwai@suse.de>
 <8ca25787-fc03-7942-0705-3ec7d88862a6@collabora.com>
 <20190607190021.GK2456@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6959db6d-1ab4-8f94-7e58-57606b8b42f6@linux.intel.com>
Date: Fri, 7 Jun 2019 15:08:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607190021.GK2456@sirena.org.uk>
Content-Type: multipart/mixed; boundary="------------00ECFFF18126FC8F2B9D28E7"
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, "kernelci.org bot" <bot@kernelci.org>,
 tomeu.vizoso@collabora.com, Takashi Iwai <tiwai@suse.de>, khilman@baylibre.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, matthew.hart@linaro.org,
 mgalka@collabora.com, enric.balletbo@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] next/master boot bisection: next-20190528 on
 sun8i-h3-libretech-all-h3-cc
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

This is a multi-part message in MIME format.
--------------00ECFFF18126FC8F2B9D28E7
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/19 2:00 PM, Mark Brown wrote:
> On Fri, Jun 07, 2019 at 05:31:12PM +0100, Guillaume Tucker wrote:
>> On 30/05/2019 16:53, Takashi Iwai wrote:
> 
>>>> +	mutex_lock(&client_mutex);
>>>>   	for_each_rtdcom(rtd, rtdcom) {
>>>>   		component = rtdcom->component;
>>>>   
>>>>   		if (component->driver->remove_order == order)
>>>>   			soc_remove_component(component);
>>>>   	}
>>>> +	mutex_unlock(&client_mutex);
> 
>>> Ranjani, which code path your patch tries to address?  Maybe better to
>>> wrap client_mutex() in the caller side like snd_soc_unbind_card()?
> 
>> Is anyone looking into this issue?
> 
>> It is still occurring in next-20190606, there was a bisection
>> today which landed on the same commit.  There just hasn't been
>> any new bisection reports because they have been temporarily
>> disabled while we fix some issues on kernelci.org.
> 
> I was expecting that Ranjani or one of the other Intel people was
> looking into it...

Ack. We've all been underwater this week and this wasn't addressed, 
sorry about the delay. It's probably wise to revert this commit at this 
point while we look for an alternate solution?

There was an initial proposal submitted on GitHub [1] (patch attached) 
which implemented what Takashi suggested in his comments. This proposal 
was later optimized further, it could be that the optimization was one 
bridge too far.

Could you let us know if this attached patch has any negative effects on 
non-Intel platforms?

Thanks!

[1] 
https://github.com/thesofproject/linux/commit/9fd09dd417bc8be7a4a8bdd1621558151f8d117b

--------------00ECFFF18126FC8F2B9D28E7
Content-Type: text/x-patch;
 name="9fd09dd417bc8be7a4a8bdd1621558151f8d117b.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="9fd09dd417bc8be7a4a8bdd1621558151f8d117b.patch"

From 9fd09dd417bc8be7a4a8bdd1621558151f8d117b Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 22 May 2019 10:52:40 -0700
Subject: [PATCH] ASoC: core: lock client_mutex while removing link components

Removing link components results in topology unloading. So,
acquire the client_mutex before removing components in
snd_soc_unbind_card(). This will prevent lockdep warning
when the dai link is removed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2403bec2fccf3..5609398f05d80 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2839,12 +2839,14 @@ static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 		snd_soc_dapm_shutdown(card);
 		snd_soc_flush_all_delayed_work(card);
 
+		mutex_lock(&client_mutex);
 		/* remove all components used by DAI links on this card */
 		for_each_comp_order(order) {
 			for_each_card_rtds(card, rtd) {
 				soc_remove_link_components(card, rtd, order);
 			}
 		}
+		mutex_unlock(&client_mutex);
 
 		soc_cleanup_card_resources(card);
 		if (!unregister)

--------------00ECFFF18126FC8F2B9D28E7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------00ECFFF18126FC8F2B9D28E7--
