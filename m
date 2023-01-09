Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92146662743
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 14:37:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F58C74A;
	Mon,  9 Jan 2023 14:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F58C74A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673271431;
	bh=WxFELKqJTymY3MOenvm2x2pcCjd9fVrkAPqGPjcqJ9s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YT/xtfZPGqL5/nZx0Q8ZIp76zykbgLkfmTursL2vRtg9qpuAcKIe3oIL6MBmpx9gd
	 +UdIs+GTwhJYgXvDzk2R5xh/I4UVAg4q5sKZ2nZrC0epLyRAauuMgclgMnpRsbXOH8
	 lC5Jjd09inkzRHW3YMJCO9eUMgvrDAmyvnic/t1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A81F8026A;
	Mon,  9 Jan 2023 14:36:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 246B9F8026A; Mon,  9 Jan 2023 14:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42BA7F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 14:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BA7F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=zYnxmFdY
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AA9A5A0040;
 Mon,  9 Jan 2023 14:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AA9A5A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673271366; bh=f2GqUf1cW2FRwVBF1cKFnGll2JhGmKIGzLlt2Uudu+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zYnxmFdY+pnNgl2bfkA4Lid2Ih+melJfNu4K1+x5uvxpl6qVkSpQ6hahXmEWy7nWL
 PZmRYaD5Y6PJzRz4fVdjLKZaP4xdd7JzHY878j20WKzZu7TZYU3a8G7u7/D+SO+XBo
 mIuDG5OubgSuIioB0bp0zAnFNMSx80QZSQjY2Tv8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 14:36:00 +0100 (CET)
Message-ID: <ef91d500-60e8-fdfd-b661-161e7f2b12a3@perex.cz>
Date: Mon, 9 Jan 2023 14:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH linux-next] ALSA: control-led: use strscpy() to instead of
 strncpy()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, yang.yang29@zte.com.cn
References: <202301091945513559977@zte.com.cn> <87zgarg9ul.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87zgarg9ul.wl-tiwai@suse.de>
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
Cc: xu.panda@zte.com.cn, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09. 01. 23 13:40, Takashi Iwai wrote:
> On Mon, 09 Jan 2023 12:45:51 +0100,
> <yang.yang29@zte.com.cn> wrote:
>>
>> From: Xu Panda <xu.panda@zte.com.cn>
>>
>> The implementation of strscpy() is more robust and safer.
>> That's now the recommended way to copy NUL-terminated strings.
>>
>> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
>> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
>> ---
>>   sound/core/control_led.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
>> index f975cc85772b..c88653c205eb 100644
>> --- a/sound/core/control_led.c
>> +++ b/sound/core/control_led.c
>> @@ -534,8 +534,7 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
>>   	struct snd_ctl_elem_id id;
>>   	int err;
>>
>> -	strncpy(buf2, buf, len);
>> -	buf2[len] = '\0';
>> +	strncpy(buf2, buf, len + 1);
> 
> Still using strncpy()...?

The original code should be:

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index f975cc85772b..b44abefcb593 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -530,7 +530,7 @@ static ssize_t set_led_id(struct snd_ctl_led_card 
*led_card, const char *buf, si
                           bool attach)
  {
         char buf2[256], *s, *os;
-       size_t len = max(sizeof(s) - 1, count);
+       size_t len = min(sizeof(buf2) - 1, count);
         struct snd_ctl_elem_id id;
         int err;

But it can be replaced with:

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index f975cc85772b..41d4e898d34c 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -530,12 +530,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card 
*led_card, const char *buf, si
                           bool attach)
  {
         char buf2[256], *s, *os;
-       size_t len = max(sizeof(s) - 1, count);
         struct snd_ctl_elem_id id;
         int err;

-       strncpy(buf2, buf, len);
-       buf2[len] = '\0';
+       if (strscpy(buf2, buf, count) < 0)
+               return -E2BIG;
         memset(&id, 0, sizeof(id));
         id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
         s = buf2;

I'll send a patch ASAP.

				Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
