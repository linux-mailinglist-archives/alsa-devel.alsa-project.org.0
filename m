Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64589A4B70
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Sep 2019 21:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A76167B;
	Sun,  1 Sep 2019 21:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A76167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567367106;
	bh=/G3sLVTUdVYwEQhllljzPrR3FP8SWFhCGvzoDc0+VsY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/ibOzZRJ/l7CrAnj9qOpCuUZnQu+6rbRaI04MWMEaHr5XLbqjXnZJAaY+55Bfw9u
	 VvnND4Up/QcYi4chsAyvwG+sLC03R1GLCJOxdt4WYdPt+Sbj8JeAVi+ptTOW3Cwhmx
	 xj8KBTYtK4mwSgwmqEz1Ta5v1DLWRX2/UUVgKpWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA97F803D7;
	Sun,  1 Sep 2019 21:43:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE074F803D7; Sun,  1 Sep 2019 21:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E30B2F801DF
 for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2019 21:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E30B2F801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rsad0/GC"
Received: by mail-io1-xd41.google.com with SMTP id h144so9793646iof.7
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=h/xjXgWosxdQaufj8AvjAxM/bIsZfFnrMq3dRFuLwdo=;
 b=rsad0/GCrnmZBp+UqxkKeFhd+h4i8NsbZcCGhY5zMeScdAsZb304z8Bd6RyWpB+MS/
 92TkFv+KKtGYjfzlG862KUhWmkzp6ZIOdOb3QyYGt/iU6+UeDnDjVhwxVtZ46dNl/E6K
 YiP9zUUCcH+AcbIgMkZWCkVqaXa4fkTXkCm6h8Xz1wPWQsJwoa3KNPLUnDO1OIYJn30z
 im29DPjenTE/jFCe59EygMa4COZIg5RPWN+N954jeDQE3jkc3u1h7SIwsc+wyb7OYQiR
 6r25cQwlG/MpXOOgrbSZoi2hPdnYjXeVEAYZ7h2EHyAGQPZvmW0I9fFLeP9gBCJg6Vg/
 Qkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=h/xjXgWosxdQaufj8AvjAxM/bIsZfFnrMq3dRFuLwdo=;
 b=N6mlAg47D1b0mkIXF8+rhypOeXbRl/KnXQ4QGlSSa+zXf0NliTZsqgwyvmZBSKWK/h
 1Tc9ItHUm/6/5KuDWqi7DMMx6GG4HS8I2GqbflRDa3HyMvO7Uluh8di8rYl097kKBdnn
 AMYOnRhXl6W91UYIUjkB8QlGuW17wo8wkWmow2FSwaaYgMmHJGbzrbFKY7127ceSftE4
 3oWuNYSDlleOYM6UG9S5Nb0GDXCzC0H3zAnMO4GfWLAUkTtJ5+BvLssKCmcdCwIxHYT6
 dcRuQgERtfrWOAMe2invOttsRalzpMiMtQ3MDV8nA7UalncnBOZ0GP9PeJ3jD8uIMdIx
 o0gw==
X-Gm-Message-State: APjAAAWVCR/c9FOzaNcsULlNo30C5ja6IK8INrX0DWk0WKZ5Qp4Z9Bru
 zmj+CZ+9u4b6vqiIdGgJnIU=
X-Google-Smtp-Source: APXvYqxGMt/XakV/ALegVpXkS8Go/WyaRTvdNdzYT5jhXUlyuq5uVic+caEkoIfyzyIn3KFzzSYw4Q==
X-Received: by 2002:a5e:9805:: with SMTP id s5mr10833814ioj.195.1567366995067; 
 Sun, 01 Sep 2019 12:43:15 -0700 (PDT)
Received: from [10.164.9.36] (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.gmail.com with ESMTPSA id l13sm13688122iob.73.2019.09.01.12.43.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Sep 2019 12:43:14 -0700 (PDT)
To: carnil@debian.org
References: <20190830214649.27761-1-benquike@gmail.com>
 <20190901125809.GA23334@eldamar.local>
From: Hui Peng <benquike@gmail.com>
Message-ID: <df31a1f9-623a-aff6-fa7c-01eba3fd0f63@gmail.com>
Date: Sun, 1 Sep 2019 15:43:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901125809.GA23334@eldamar.local>
Content-Type: multipart/mixed; boundary="------------C17843906CF228CD9BE7D7BA"
Content-Language: en-US
Cc: mathias.payer@nebelwelt.net, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, wang6495@umn.edu, tiwai@suse.com,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] Fix an OOB bug in
	parse_audio_mixer_unit
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
--------------C17843906CF228CD9BE7D7BA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 9/1/19 8:58 AM, Salvatore Bonaccorso wrote:
> On Fri, Aug 30, 2019 at 05:46:49PM -0400, Hui Peng wrote:
>> The `uac_mixer_unit_descriptor` shown as below is read from the
>> device side. In `parse_audio_mixer_unit`, `baSourceID` field is
>> accessed from index 0 to `bNrInPins` - 1, the current implementation
>> assumes that descriptor is always valid (the length  of descriptor
>> is no shorter than 5 + `bNrInPins`). If a descriptor read from
>> the device side is invalid, it may trigger out-of-bound memory
>> access.
>>
>> ```
>> struct uac_mixer_unit_descriptor {
>> 	__u8 bLength;
>> 	__u8 bDescriptorType;
>> 	__u8 bDescriptorSubtype;
>> 	__u8 bUnitID;
>> 	__u8 bNrInPins;
>> 	__u8 baSourceID[];
>> }
>> ```
>>
>> This patch fixes the bug by add a sanity check on the length of
>> the descriptor.
>>
>> CVE: CVE-2018-15117
> FWIW, the correct CVE id should be probably CVE-2019-15117 here.

Yes, the CVE id was wrong. I have updated it in the attached patch.

> But there was already a patch queued and released in 5.2.10 and
> 4.19.68 for this issue (as far I can see; is this correct?)

Yes, it should have been fixed in those branches.

But google asked me to back port it to v4.4.190 and v4.14.141.

I have mentioned it in one previous email, but it was blocked by vger
because it was sent in html format.

Can you apply it to these 2 versions? (it applies to both versions)

Thanks.

> Regards,
> Salvatore

--------------C17843906CF228CD9BE7D7BA
Content-Type: text/x-patch;
 name="0001-Fix-an-OOB-bug-in-parse_audio_mixer_unit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Fix-an-OOB-bug-in-parse_audio_mixer_unit.patch"

From 09942398a53bbe730264b782673890d4a54068d0 Mon Sep 17 00:00:00 2001
From: Hui Peng <benquike@gmail.com>
Date: Fri, 30 Aug 2019 16:11:00 -0400
Subject: [PATCH 1/2] Fix an OOB bug in parse_audio_mixer_unit

The `uac_mixer_unit_descriptor` shown as below is read from the
device side. In `parse_audio_mixer_unit`, `baSourceID` field is
accessed from index 0 to `bNrInPins` - 1, the current implementation
assumes that descriptor is always valid (the length  of descriptor
is no shorter than 5 + `bNrInPins`). If a descriptor read from
the device side is invalid, it may trigger out-of-bound memory
access.

```
struct uac_mixer_unit_descriptor {
	__u8 bLength;
	__u8 bDescriptorType;
	__u8 bDescriptorSubtype;
	__u8 bUnitID;
	__u8 bNrInPins;
	__u8 baSourceID[];
}
```

This patch fixes the bug by add a sanity check on the length of
the descriptor.

CVE: CVE-2019-15117

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 1f7eb3816cd7..10ddec76f906 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1628,6 +1628,7 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 	int pin, ich, err;
 
 	if (desc->bLength < 11 || !(input_pins = desc->bNrInPins) ||
+	    desc->bLength < sizeof(*desc) + desc->bNrInPins ||
 	    !(num_outs = uac_mixer_unit_bNrChannels(desc))) {
 		usb_audio_err(state->chip,
 			      "invalid MIXER UNIT descriptor %d\n",
-- 
2.17.1


--------------C17843906CF228CD9BE7D7BA
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------C17843906CF228CD9BE7D7BA--
