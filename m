Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F505453F3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 20:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC9F1EE1;
	Thu,  9 Jun 2022 20:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC9F1EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654798695;
	bh=N6WWgkMA9YuhAhpTkaJ/XmXGlVvLqXPPFlaLrRmzBNs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZicfDrX/p4wsB+7F4sFI6OM+2L9x152Ttml0Aq7RuxsHAfG9cg7IlqzACG5lCyjzi
	 3z0gTQOZpX8XNwztRPPpF7beaq9c75HIWR1uqXzrn2QrlRrFa+UtzdouB+W7rd/ni7
	 9N4EoNyiYQLu7QTXHv7lNY3ph6+5v/7Ck96pqsNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5322AF80240;
	Thu,  9 Jun 2022 20:17:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B2F7F801F5; Thu,  9 Jun 2022 20:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B0D1F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 20:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B0D1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Wm9Y45BF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654798624; x=1686334624;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=oaG8OZar32Chf0fMw+rowAX9wF+Ktk1UDEz5CR+Fdc0=;
 b=Wm9Y45BFzodUQDVJ4rnmKCirIQHZf4OWWtGclA2jRrUM8hlkyX146EaG
 I+VaTqMNHAOX84qjWrDdu49ixNuTF6XL3fF/KhOPOGhphwSbyw93NKbAZ
 WEzVPDaIJOk7pP2swCR0GqPBlHW7HR5kSLuTwAHS6MUeWTbJzCmCdnwlF I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jun 2022 11:16:58 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 11:16:58 -0700
Received: from [10.50.9.76] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 11:16:55 -0700
Message-ID: <f3a25238-fcc6-2381-e329-0bd80a3632a5@quicinc.com>
Date: Thu, 9 Jun 2022 23:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <cover.1653813866.git.quic_rbankapu@quicinc.com>
 <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
 <8735gsznnt.wl-tiwai@suse.de>
From: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>
In-Reply-To: <8735gsznnt.wl-tiwai@suse.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Our implementation also falls inline with your approach [PATCH RFC] 
ALSA: control: Use xarray for faster lookups (kernel.org) 
<https://lore.kernel.org/all/20211028130027.18764-1-tiwai@suse.de/T/>, 
but you approach looks to be clean with xarray.

is it possible to upstream those changes?

Regards

Raghu Bankapur

On 5/29/2022 3:05 PM, Takashi Iwai wrote:
> On Sun, 29 May 2022 10:50:09 +0200,
> Raghu Bankapur wrote:
>> use hashtabe instead of linear list to check kcontrol before
>> adding them for improving early audio KPI.
>>
>> Change-Id: I7134816736e08e338c0f22a8ae283a0520aa847a
>> Signed-off-by: Raghu Bankapur<quic_rbankapu@quicinc.com>
> Aha, interesting, a faster lookup is indeed measurable and needed.
>
> One point with your patch is whether it works when a control element
> gets removed dynamically.  It's often the case with the user-space
> kctls.  Also, multiple ctl elements may have the same name string but
> with different index or device number.  Comparing only the string
> isn't enough.  (And I wonder how about the hash key collision.)
>
> FWIW, I posted an RFC patch faster lookup with Xarray some time ago:
>    https://lore.kernel.org/all/20211028130027.18764-1-tiwai@suse.de/T/
>
>
> thanks,
>
> Takashi
>
>
>> ---
>>   include/sound/control.h |  4 ++
>>   include/sound/core.h    | 12 +++++-
>>   sound/core/control.c    | 92 +++++++++++++++++++++++++++++++++--------
>>   sound/core/init.c       |  3 ++
>>   sound/soc/Kconfig       |  9 ++++
>>   5 files changed, 101 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/sound/control.h b/include/sound/control.h
>> index 985c51a8fb74..1b85d36c2066 100644
>> --- a/include/sound/control.h
>> +++ b/include/sound/control.h
>> @@ -70,6 +70,10 @@ struct snd_kcontrol_volatile {
>>   struct snd_kcontrol {
>>   	struct list_head list;		/* list of controls */
>>   	struct snd_ctl_elem_id id;
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	struct hlist_node hnode;
>> +	unsigned int knametoint;		/* kctl name to uint, hash key value */
>> +#endif
>>   	unsigned int count;		/* count of same elements */
>>   	snd_kcontrol_info_t *info;
>>   	snd_kcontrol_get_t *get;
>> diff --git a/include/sound/core.h b/include/sound/core.h
>> index b7e9b58d3c78..dd6714fc43ff 100644
>> --- a/include/sound/core.h
>> +++ b/include/sound/core.h
>> @@ -14,7 +14,9 @@
>>   #include <linux/pm.h>			/* pm_message_t */
>>   #include <linux/stringify.h>
>>   #include <linux/printk.h>
>> -
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +#include <linux/hashtable.h>
>> +#endif
>>   /* number of supported soundcards */
>>   #ifdef CONFIG_SND_DYNAMIC_MINORS
>>   #define SNDRV_CARDS CONFIG_SND_MAX_CARDS
>> @@ -24,6 +26,10 @@
>>   
>>   #define CONFIG_SND_MAJOR	116	/* standard configuration */
>>   
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +#define SND_CTL_HASH_TABLE_BITS 14	/* buckets numbers: 1 << 14 */
>> +#endif
>> +
>>   /* forward declarations */
>>   struct pci_dev;
>>   struct module;
>> @@ -103,7 +109,9 @@ struct snd_card {
>>   	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
>>   	struct list_head controls;	/* all controls for this card */
>>   	struct list_head ctl_files;	/* active control files */
>> -
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	DECLARE_HASHTABLE(ctl_htable, SND_CTL_HASH_TABLE_BITS);
>> +#endif
>>   	struct snd_info_entry *proc_root;	/* root for soundcard specific files */
>>   	struct proc_dir_entry *proc_root_link;	/* number link to real id */
>>   
>> diff --git a/sound/core/control.c b/sound/core/control.c
>> index a25c0d64d104..914d05647497 100644
>> --- a/sound/core/control.c
>> +++ b/sound/core/control.c
>> @@ -368,6 +368,47 @@ enum snd_ctl_add_mode {
>>   	CTL_ADD_EXCLUSIVE, CTL_REPLACE, CTL_ADD_ON_REPLACE,
>>   };
>>   
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +char snd_ctl_string[50] = { '\0' };
>> +
>> +/* Used to convert the string into int value -- BKDRHash */
>> +unsigned int snd_ctl_strtoint(const char *s)
>> +{
>> +	unsigned int res = 0;
>> +
>> +	while (*s)
>> +		res = (res << 5) - res + (*s++);
>> +
>> +	return (res & 0x7FFFFFFF);
>> +}
>> +
>> +/**
>> + * snd_ctl_hash_check - Check the duplicate enrty on snd hashtable
>> + * @card: the card instance
>> + * @nametoint: kctl name to uint
>> + *
>> + * Finds the control instance with the given nametoint from the card.
>> + *
>> + * Return: The pointer of the instance if found, or %NULL if not.
>> + *
>> + */
>> +static struct snd_kcontrol *snd_ctl_hash_check(struct snd_card *card,
>> +				 unsigned int nametoint)
>> +{
>> +	struct snd_kcontrol *kctl = NULL;
>> +
>> +	if (snd_BUG_ON(!card))
>> +		return NULL;
>> +
>> +	hash_for_each_possible(card->ctl_htable, kctl, hnode, nametoint) {
>> +		if (kctl->knametoint != nametoint)
>> +			continue;
>> +		return kctl;
>> +	}
>> +	return NULL;
>> +}
>> +#endif
>> +
>>   /* add/replace a new kcontrol object; call with card->controls_rwsem locked */
>>   static int __snd_ctl_add_replace(struct snd_card *card,
>>   				 struct snd_kcontrol *kcontrol,
>> @@ -382,24 +423,38 @@ static int __snd_ctl_add_replace(struct snd_card *card,
>>   	if (id.index > UINT_MAX - kcontrol->count)
>>   		return -EINVAL;
>>   
>> -	old = snd_ctl_find_id(card, &id);
>> -	if (!old) {
>> -		if (mode == CTL_REPLACE)
>> -			return -EINVAL;
>> -	} else {
>> -		if (mode == CTL_ADD_EXCLUSIVE) {
>> -			dev_err(card->dev,
>> -				"control %i:%i:%i:%s:%i is already present\n",
>> -				id.iface, id.device, id.subdevice, id.name,
>> -				id.index);
>> -			return -EBUSY;
>> -		}
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	snprintf(snd_ctl_string, strlen(kcontrol->id.name) + 6, "%s%d%d%d",
>> +		kcontrol->id.name, kcontrol->id.iface, kcontrol->id.device,
>> +		kcontrol->id.subdevice);
>>   
>> -		err = snd_ctl_remove(card, old);
>> -		if (err < 0)
>> -			return err;
>> -	}
>> +	kcontrol->knametoint = snd_ctl_strtoint(snd_ctl_string);
>> +	if (kcontrol->knametoint < 0)
>> +		return -EINVAL;
>> +
>> +	old = snd_ctl_hash_check(card, kcontrol->knametoint);
>> +	if (old) {
>> +#endif
>> +		old = snd_ctl_find_id(card, &id);
>> +		if (!old) {
>> +			if (mode == CTL_REPLACE)
>> +				return -EINVAL;
>> +		} else {
>> +			if (mode == CTL_ADD_EXCLUSIVE) {
>> +				dev_err(card->dev,
>> +					"control %i:%i:%i:%s:%i is already present\n",
>> +					id.iface, id.device, id.subdevice, id.name,
>> +					id.index);
>> +				return -EBUSY;
>> +			}
>>   
>> +			err = snd_ctl_remove(card, old);
>> +			if (err < 0)
>> +				return err;
>> +		}
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	}
>> +#endif
>>   	if (snd_ctl_find_hole(card, kcontrol->count) < 0)
>>   		return -ENOMEM;
>>   
>> @@ -410,7 +465,10 @@ static int __snd_ctl_add_replace(struct snd_card *card,
>>   
>>   	for (idx = 0; idx < kcontrol->count; idx++)
>>   		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
>> -
>> +		
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	hash_add(card->ctl_htable, &kcontrol->hnode, kcontrol->knametoint);
>> +#endif
>>   	return 0;
>>   }
>>   
>> diff --git a/sound/core/init.c b/sound/core/init.c
>> index 31ba7024e3ad..fda38b2137ee 100644
>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
>> @@ -284,6 +284,9 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>>   	INIT_LIST_HEAD(&card->ctl_files);
>>   	spin_lock_init(&card->files_lock);
>>   	INIT_LIST_HEAD(&card->files_list);
>> +#ifdef CONFIG_SND_CTL_HASHTABLE
>> +	hash_init(card->ctl_htable);
>> +#endif
>>   	mutex_init(&card->memory_mutex);
>>   #ifdef CONFIG_PM
>>   	init_waitqueue_head(&card->power_sleep);
>> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
>> index 5dcf77af07af..0eb18f8ee6fd 100644
>> --- a/sound/soc/Kconfig
>> +++ b/sound/soc/Kconfig
>> @@ -58,6 +58,15 @@ config SND_SOC_TOPOLOGY_KUNIT_TEST
>>   config SND_SOC_ACPI
>>   	tristate
>>   
>> +config SND_CTL_HASHTABLE
>> +	bool "Add SND CTL hashtable"
>> +	help
>> +	  This enables hash table in sound card for kcontrols. The traditional way is
>> +	  traversing the linked list of controls and compare each exsiting control with
>> +	  the new kcontrol to find out whether there are duplicate kcontrols, which will
>> +	  consumes much time during bootup. Enable this will use hash table instead of
>> +	  linked list to check new kcontrol and reduce much time for sound card registration.
>> +
>>   # All the supported SoCs
>>   source "sound/soc/adi/Kconfig"
>>   source "sound/soc/amd/Kconfig"
>> -- 
>> 2.17.1
>>
