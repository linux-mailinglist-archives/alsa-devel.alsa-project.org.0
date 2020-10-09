Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287828908F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 20:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2B11682;
	Fri,  9 Oct 2020 20:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2B11682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602266770;
	bh=noE7u+KyvDcokFzo/daH38nvO6dW5oH94EFHaG6gdnk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uc9zj34GM5FFZLcvdK50s0EvR0pQlEcgbDlhuFiGMRBmg3cQpiGS/9DZqq7i7PeCw
	 jepCp3S88FqAiZ0hJwJaTw3O9gQID3JU3eTq5e6UsBh6k+zG2hwKkUTUjaBnbMf4so
	 4gaStVQrP2f3nJODpwYLAe/++v1TKNCFeoYwTWWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D58F5F8014D;
	Fri,  9 Oct 2020 20:04:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A766F8015B; Fri,  9 Oct 2020 20:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84AA0F80148
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 20:04:22 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B8EA6A003F;
 Fri,  9 Oct 2020 20:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B8EA6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602266660; bh=MbpdiVMVZhZt/BVN1k43bZ5h7pdIafUw+iT8IrM15yY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=EdHa3Pp4COy8D++6FxtaNs8XhqrsVtWhledmF8tmsr/LYbYeuRF3BUg1cHcilKJBT
 86fvm/Oeq7zRxwB6/9y+AufQHc9SJVQW68kPuynky0Hlaeo/Q+XJo3jHyXIG8IO2n6
 COvrYmDHpezI9RbfkTLX6OP+1sqGLJKuE+uc/yGY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Oct 2020 20:04:16 +0200 (CEST)
Subject: Re: snd_pcm_status() does not update status->avail
To: Jonas Holmberg <jonashg@axis.com>,
 Jonas Holmberg <jonas.holmberg@axis.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>
References: <d9c1f37e-5c8d-f289-270e-c6cda7a56ce3@axis.com>
 <2d4ca02d-8be3-62ca-c273-f5b277e64158@perex.cz>
 <c4860adb-70fb-7209-58bf-8cc785f7e548@axis.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bcb8ef78-5500-c3c1-085d-6bc063242fdc@perex.cz>
Date: Fri, 9 Oct 2020 20:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c4860adb-70fb-7209-58bf-8cc785f7e548@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dne 09. 10. 20 v 17:10 Jonas Holmberg napsal(a):
> On 2020-10-09 16:30, Jaroslav Kysela wrote:
> 
>> It seems that nobody is using those status fields. Usually,
>> snd_pcm_avail_update() is used by apps. Anyway, this should be fixed for 
>> both
>> directions. The avail should be probably synced to
>> snd_pcm_plugin_avail_update() output:
>>
>>
>> diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
>> index ea60eb98..5739cfc2 100644
>> --- a/src/pcm/pcm_plugin.c
>> +++ b/src/pcm/pcm_plugin.c
>> @@ -541,16 +541,20 @@ static snd_pcm_sframes_t
>> snd_pcm_plugin_avail_update(snd_pcm_t *pcm)
>>   static int snd_pcm_plugin_status(snd_pcm_t *pcm, snd_pcm_status_t * 
>> status)
>>   {
>>          snd_pcm_plugin_t *plugin = pcm->private_data;
>> -       snd_pcm_sframes_t err;
>> +       snd_pcm_sframes_t err, avail;
>>
>>          /* sync with the latest hw and appl ptrs */
>> -       snd_pcm_plugin_avail_update(pcm);
>> +       avail = snd_pcm_plugin_avail_update(pcm);
>> +       if (avail < 0)
>> +               return avail;
>>
>>          err = snd_pcm_status(plugin->gen.slave, status);
>>          if (err < 0)
>>                  return err;
>>          status->appl_ptr = *pcm->appl.ptr;
>>          status->hw_ptr = *pcm->hw.ptr;
>> +       status->avail = avail;
>> +       status->delay = snd_pcm_mmap_delay(pcm);
>>          return 0;
>>   }
>>
>>                                          Jaroslav
>>
> 
> I have tested your patch and it solves my problem. Are you going to push it?

Yes, applied to alsa-lib's repo:

https://lore.kernel.org/alsa-devel/d9c1f37e-5c8d-f289-270e-c6cda7a56ce3@axis.com/

Thank you for your report.

				Jaroslav

> 
> Thanks!
> /Jonas
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
