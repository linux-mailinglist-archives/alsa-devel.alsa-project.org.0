Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BD1618C5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 18:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0464166E;
	Mon, 17 Feb 2020 18:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0464166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581960314;
	bh=QJNruwC8MQU8NKbEEzXFqRgdbl+D8+Iaz8Vpoc8/jVw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qn0JGKB+FxCNvJSr0FkyzuCxy4/5fmNPAnbr9HUTqmXwWDiERd4VsA/UgH/VCQZlR
	 nO4vCrRTFMhDZdFCkGhnvDugQk20zBCqDeYb52Ui/nTzSjUy5tbz46TapRwuC8m1Ze
	 S1U5sHekk1iVXcFbXIps+TtzPXLrIEiATb1mmAHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E155BF801F5;
	Mon, 17 Feb 2020 18:23:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460B3F80172; Mon, 17 Feb 2020 18:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFC2F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 18:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFC2F800B6
Received: from [192.168.1.183] ([37.4.249.150]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N9d91-1jZl6s0qk1-015aWl; Mon, 17 Feb 2020 18:23:23 +0100
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <applied-20200214134704.342501-1-jbrunet@baylibre.com>
 <CGME20200217121336eucas1p2deb35417f5c4646a89762fd6146c3cf9@eucas1p2.samsung.com>
 <f666e600-2b44-f1fa-7ccf-aa44da6b8979@samsung.com>
 <1jlfp1z70u.fsf@starbuckisacylon.baylibre.com>
 <20557448-d6d2-7584-e2ac-c46d337e1778@samsung.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <feb041d5-ed81-31fd-aa6a-23a902624f57@i2se.com>
Date: Mon, 17 Feb 2020 18:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20557448-d6d2-7584-e2ac-c46d337e1778@samsung.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Xt+hZmRi0aOwwMya27cgmCWcks1EEpbTJtNRFjlGhzP8kxGKFR7
 TQ69RJBE0CTvrbDWn5rO70tIGKbXZnIjpUIhSqm0BLTIdDR8CODAm7wn88RTamvMUlWQXD1
 Lht9vbbBgXcr1X5dB5GRnVb8+Mvk+uFoaGQ6ONv93OweGd7MWJVstx7nY202YDNjpwksRaL
 XjwAfOmT8t8/JHnSz0/NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J7Q4j26HoAk=:qM72JtidTPt1ZOn6VF7K2Z
 9jOKSYWZogILexTb228BYeuRHwi31Wi4iykD4vz/YMsRXeWQZa7Z4pBDKt7e0CUs3L6zwghNb
 L9PjNB4zpw8A9ux6FI5U8qtm/4xpFqIQRlQ8sUVj+OROj0kzuSkvac9vAMwsgHkov8BcJS9Ym
 DVZX3Q+ubOUE7YLG6AkPLdwCf6MH7HwiDOGPL3sHEHVFZZUAkqeI9NkeMKTwR2Kcrn69FMfw0
 RaXSRtSJ1FyAO9VAgLpOp9Iqs7HbY4+wZjJ7REN5iuDLSSVeGzgbnGXtaREIJySTTXLslEOeL
 uVh7S2+GLeQWOHEIhPN5p7ipVd1/3whh3f2IDSL5i+EVVE0slB5VzJOdaxfwcR68MajL/UKRR
 IRxB1N/hwZFolRSL+wWqhCUTVyBie8ySuTIHCNqk82NGnh01E+gUUUcOXsZjEDk7ll3qb/De/
 zaJmOH43F87rKoCUuC/67SqGRfP3axHxqyMELdaOxGp9mousa2nw6JLezhO5gmAkv0IG0MU0B
 wUcHcQhq8fva6vq6XRbAW1KjnWWtJdVPguQLDfx03m2FS1EvGsYssxgN+ll+B3luBNrtcBMzX
 ALUy5Ckhen4LHABIqI5OA04+IJFDqWU3uDj3IWe6s9wPZWaKHkuxT3etjOYdxutTuawf0vQHJ
 lBB4gw9M7bpbDTOY9gQS6EaXDa4zjyTcrsUIJqRsZHxQ+mxlmbaNj9DMj7LJKgNp8AWF0D9kk
 EXObWdzYrNUntPG4z/XBNHoXnYFf2+2bs7qHEdq199OEj8Dn6BgUeU8EkCaKG2v/4HYxAXnwo
 WvYVZX7oZ/HnUnsErB9AGDId9k4BFJwJdpMiVuUgUlbYDZHQvEk9hdMvQmJ24xgPXt6NuHP
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Applied "ASoC: core: ensure component names are
 unique" to the asoc tree
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am 17.02.20 um 15:36 schrieb Marek Szyprowski:
> Hi Jerome,
>
> On 17.02.2020 14:18, Jerome Brunet wrote:
>> On Mon 17 Feb 2020 at 13:13, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> On 14.02.2020 21:56, Mark Brown wrote:
>>>> Thanks,
>>>> Mark
>>>>
>>>>   From b2354e4009a773c00054b964d937e1b81cb92078 Mon Sep 17 00:00:00 2001
>>>> From: Jerome Brunet <jbrunet@baylibre.com>
>>>> Date: Fri, 14 Feb 2020 14:47:04 +0100
>>>> Subject: [PATCH] ASoC: core: ensure component names are unique
>>>>
>>>> Make sure each ASoC component is registered with a unique name.
>>>> The component is derived from the device name. If a device registers more
>>>> than one component, the component names will be the same.
>>>>
>>>> This usually brings up a warning about the debugfs directory creation of
>>>> the component since directory already exists.
>>>>
>>>> In such case, start numbering the component of the device so the names
>>>> don't collide anymore.
>>>>
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> Link: https://lore.kernel.org/r/20200214134704.342501-1-jbrunet@baylibre.com
>>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>>> This patch landed in today's linux-next and I've noticed that it breaks
>>> registration of VC4 DRM driver on Raspberry Pi3 boards (I've compiled
>>> kernel from bcm2835_defconfig):
>> I think I have an idea about what is going on. (good catch in the defer BTW)
>>
>> 1) Funny to see that the vc4-hdmi already registers several (3) ASoC
>> components. It must have had warning about the debugfs entry before this patch.
> Okay, right, before this patch there is a warning from debugfs I've 
> missed (debugfs was not enabled in bcm2835_defconfig):

This is unintended. I've seen patches which restored DEBUG_FS support
because of this commit:

0e4a459f56c32d tracing: Remove unnecessary DEBUG_FS dependency

Best regards
Stefan


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
