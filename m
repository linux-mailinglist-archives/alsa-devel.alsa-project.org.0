Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMB1BVI1p2k9fwAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:02 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6781F5EF2
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B86926022F;
	Tue,  3 Mar 2026 20:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B86926022F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772565839;
	bh=+isYS/A1ddc4bXaYmSq5j0VjzO5wrpF96XT61ST9+qc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCN8SwNmyPZop9RmTcnHhMQhw8f4x/rS8s/hxCGo+aW1+lVnAHq/RaQRoumQiuzrE
	 CdmlTj2elsmAtr4QY8oBI8R+BaEgGwlFGDuLMrk8TbmkVETLlgtsm8lVyRXND4JWxR
	 yDvDZBB/Bm984aVU7Ii2mZq922jEmuExKk/WWKTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C67FF805E0; Tue,  3 Mar 2026 20:23:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA41FF805BE;
	Tue,  3 Mar 2026 20:23:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0975F804B4; Tue,  3 Mar 2026 20:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97F22F8015B
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 20:23:20 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 331DB2E6A;
	Tue,  3 Mar 2026 20:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 331DB2E6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1772565799; bh=BaduwV1QdGJvXYLZjbFIHDMOkRuUACDPwqpSeXs7aVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RolMTCN4SqCYgFWVBPhr1pea5oieOCt4mWghCeVdvgGsofF2eclFkhFfYX65qsllo
	 pfINqcrAxcrYDc9Yl/bTGzJdtFtf+xXjoRWnYcxDXI73ipwpgXQuowy3Bv8z+BptBu
	 bDBWTTaLS5Fnz5m2BzxoRQoJ7BN4Pri9dpIECvx0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  3 Mar 2026 20:23:11 +0100 (CET)
Message-ID: <2a28e6a4-f6c8-4539-a45e-bd5ce7da43c6@perex.cz>
Date: Tue, 3 Mar 2026 20:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
To: Takashi Iwai <tiwai@suse.de>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
 <20260303145815.9930-2-mstrozek@opensource.cirrus.com>
 <87seagx6c4.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <87seagx6c4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VZZANMMOGDPCE7UXZ5CI45I3FPOODHT4
X-Message-ID-Hash: VZZANMMOGDPCE7UXZ5CI45I3FPOODHT4
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZZANMMOGDPCE7UXZ5CI45I3FPOODHT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 9D6781F5EF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[perex.cz,none];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,perex.cz:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:mstrozek@opensource.cirrus.com,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[perex@perex.cz,alsa-devel-bounces@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:dkim,perex.cz:email,perex.cz:mid,cirrus.com:email,suse.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,perex.cz:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[perex@perex.cz,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 16:47, Takashi Iwai wrote:
> On Tue, 03 Mar 2026 15:58:00 +0100,
> Maciej Strozek wrote:
>>
>> The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
>> small on systems with many audio devices.
>>
>> Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
>> to retrieve the full components string.
>>
>> When the legacy components field is truncated, append '>' to indicate
>> that the full string is available via the new ioctl.
>>
>> Link: https://github.com/alsa-project/alsa-lib/pull/494
>> Suggested-by: Jaroslav Kysela <perex@perex.cz>
>> Suggested-by: Takashi Iwai <tiwai@suse.com>
>> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
>> ---
>> Changes for v3:
>>   - change components field to a dynamic array resizable in 32 byte increments
>>   - removed SNDRV_CTL_COMPONENTS_LEN define
>>   - sanity check if 'components' requests more than 512 bytes
>>   - added a commit to clean up trailing whitespaces
>>   - alsa-utils link no longer needed
>> Changes for v2:
>>   - do not modify existing card->components field
>>   - add a new ioctl and struct to keep the full components string
>>   - handle the split/trim in snd_ctl_card_info()
>> ---
>>   include/sound/core.h        |  4 ++--
>>   include/uapi/sound/asound.h | 14 ++++++++++++-
>>   sound/core/control.c        | 35 ++++++++++++++++++++++++++++++++-
>>   sound/core/control_compat.c |  2 ++
>>   sound/core/init.c           | 39 +++++++++++++++++++++++++++++--------
>>   5 files changed, 82 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/sound/core.h b/include/sound/core.h
>> index 4093ec82a0a1..2b58f79b524d 100644
>> --- a/include/sound/core.h
>> +++ b/include/sound/core.h
>> @@ -87,8 +87,8 @@ struct snd_card {
>>   	char longname[80];		/* name of this soundcard */
>>   	char irq_descr[32];		/* Interrupt description */
>>   	char mixername[80];		/* mixer name */
>> -	char components[128];		/* card components delimited with
>> -								space */
>> +	char *components_ptr;
>> +	unsigned int components_ptr_alloc_size; // current memory allocation components_ptr.
>>   	struct module *module;		/* top-level module */
>>
>>   	void *private_data;		/* private data for soundcard */
>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>> index d3ce75ba938a..422b0b07613d 100644
>> --- a/include/uapi/sound/asound.h
>> +++ b/include/uapi/sound/asound.h
>> @@ -1058,7 +1058,7 @@ struct snd_timer_tread {
>>    *                                                                          *
>>    ****************************************************************************/
>>
>> -#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
>> +#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)
>>
>>   struct snd_ctl_card_info {
>>   	int card;			/* card number */
>> @@ -1072,6 +1072,17 @@ struct snd_ctl_card_info {
>>   	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
>>   };
>>
>> +/*
>> + * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
>> + * Use SNDRV_CTL_IOCTL_CARD_COMPONENTS to retrieve the full string.
>> + *
>> + */
>> +struct snd_ctl_card_components {
>> +	int card;
>> +	unsigned int length;
>> +	unsigned char *components;
>> +};
> 
> Embedding a pointer for ioctl is a nightmare for 32bit compatibility,
> and you seem to have forgotten it, too ;)

It's doable and we have other more important structures like struct snd_xferi 
using those pointers. But yes, the translation is missing in this patch set. I 
already gave hint that control_compat.c must be modified, too.

> IMO, in this case, it'd be easier to use a flex array instead, e.g.
> 
> struct snd_ctl_card_components {
> 	int card;
> 	unsigned int length;
> 	unsigned char components[];
> };

There is an issue that flex arrays will break _IOC_SIZE().

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
