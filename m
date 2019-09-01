Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF6A4B7B
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Sep 2019 21:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6E6167B;
	Sun,  1 Sep 2019 21:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6E6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567367365;
	bh=YPfGrgTGg4Xr9eYV8MOWPYYcW7clmKahtkTH+S2sr4o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwhVvtNXmnoT2Xmw9Uk6Jrqn+GIoieaMnFvuOY7W3t3t0pKghqyd2NM5EwCT85HU1
	 ZkhfFyaJhQ1uFsPMLEKzkRiu8jWiQCDwRx87iSgbdw8YABZKMJwIGQKeXfTfAigj6r
	 8giNzhhLl+cA869QPS41T1mO/JYtqxkt3Wm57YdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94565F8049B;
	Sun,  1 Sep 2019 21:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A903DF803D7; Sun,  1 Sep 2019 21:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06BCF801DF
 for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2019 21:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06BCF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iq7HAjAD"
Received: by mail-io1-xd41.google.com with SMTP id s21so25218786ioa.1
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=SbdrgYp0JCHIooetwhrkmJbqHt7Ynh9WyJyH/5s8HFY=;
 b=iq7HAjADfR30U8TZiKa30vuN13zoW56e66tic3tp67xASs6vF3W7/fWYrmbu6fukPo
 3GWpHj8JbIfDExwsc0dQ8dLEMG427ASQ5AknR5mVIP9t1zkK8ARPhq6Xutl9SDyLYuaW
 76rjS5QlfmlMycx5QmvIW83CULPRA6Ay5sIrSXz9uUuoA1GQADCWMc2b9dixprxfbr8y
 iHgX4ZzXrUN8S6iuQpkJOdwVF26XHs8Dyn66+O4c+bZkK3WJLogP/SiYJ3qdp2ZbrcAK
 XWGCI+PKLutG4TnUUD7IO7WuJwQRu0Vifz5ylO6yRMhp7ffa2Eh1j2r/TZxYoz6SszKr
 uTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=SbdrgYp0JCHIooetwhrkmJbqHt7Ynh9WyJyH/5s8HFY=;
 b=o3uUoRXNSHlFyYDz4RaPdkOQ1auzlRbtpi68THQ+pKxNPas+koCpFPCQlxM1SDXWm7
 cr++krsmaOOStDVc5p5bKkMzYmfcJSVCbc9zU+YTSU2LBfSlW4i+UIp1PialzekFONf2
 P6K1JgaUS9AW0fyIxQgYtcpbXdroQXWWuHRS4ZgGdohs4BgQIE3lJKTLJ/kT7JnTpuDY
 eGpN5hakMMexmhS818lUHrqINZhkVA12axspIAulYYHelm2DB2zyKDECFobuR2sAXXZh
 eTryp096I2LVmhC++zF4Wux5kX5P6g6m+5PgNh+cgjuCRnBcEl2gHpx6iIFS6TyPwl9k
 FoLw==
X-Gm-Message-State: APjAAAVeFz+uPL0mmJBPgBAyLLv5M8LZkjmf31G3osvAyFi/BHtsWauo
 OowUcjHG6nVTd5p3Wnaw+Bk=
X-Google-Smtp-Source: APXvYqy8f8YinGvWsit9QhIOq7PWNlq2g3epAM3mBvqvUkEX1+GOMQnwyq4TmcMvy/QDPDOCDK3eTg==
X-Received: by 2002:a6b:e609:: with SMTP id g9mr10225310ioh.7.1567367253028;
 Sun, 01 Sep 2019 12:47:33 -0700 (PDT)
Received: from [10.164.9.36] (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.gmail.com with ESMTPSA id r138sm17696679iod.59.2019.09.01.12.47.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Sep 2019 12:47:32 -0700 (PDT)
To: carnil@debian.org
References: <20190830214730.27842-1-benquike@gmail.com>
 <20190901130028.GB23334@eldamar.local>
From: Hui Peng <benquike@gmail.com>
Message-ID: <d80f1fba-8bf5-58e2-1801-5ac2308b5d4e@gmail.com>
Date: Sun, 1 Sep 2019 15:47:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901130028.GB23334@eldamar.local>
Content-Type: multipart/mixed; boundary="------------5C362557DFF1DBD4FF087E3A"
Content-Language: en-US
Cc: mathias.payer@nebelwelt.net, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, wang6495@umn.edu, tiwai@suse.com,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] Fix a stack buffer overflow bug in
	check_input_term
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
--------------5C362557DFF1DBD4FF087E3A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 9/1/19 9:00 AM, Salvatore Bonaccorso wrote:
> Hi Hui,
>
> On Fri, Aug 30, 2019 at 05:47:29PM -0400, Hui Peng wrote:
>> `check_input_term` recursively calls itself with input from
>> device side (e.g., uac_input_terminal_descriptor.bCSourceID)
>> as argument (id). In `check_input_term`, if `check_input_term`
>> is called with the same `id` argument as the caller, it triggers
>> endless recursive call, resulting kernel space stack overflow.
>>
>> This patch fixes the bug by adding a bitmap to `struct mixer_build`
>> to keep track of the checked ids and stop the execution if some id
>> has been checked (similar to how parse_audio_unit handles unitid
>> argument).
>>
>> CVE: CVE-2018-15118
> Similar to the previous one, this should be CVE-2019-15118 as far I
> can tell.

Same here: CVE id updated.

Can you apply it to  v4.4.190 and v4.14.141?

Thanks.

>
> Regards,
> Salvatore

--------------5C362557DFF1DBD4FF087E3A
Content-Type: text/x-patch;
 name="0002-Fix-a-stack-buffer-overflow-bug-in-check_input_term.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-Fix-a-stack-buffer-overflow-bug-in-check_input_term.pat";
 filename*1="ch"

From f5e478c4807b16f49c00316fb80485562b84340a Mon Sep 17 00:00:00 2001
From: Hui Peng <benquike@gmail.com>
Date: Fri, 30 Aug 2019 16:20:41 -0400
Subject: [PATCH 2/2] Fix a stack buffer overflow bug in check_input_term

`check_input_term` recursively calls itself with input from
device side (e.g., uac_input_terminal_descriptor.bCSourceID)
as argument (id). In `check_input_term`, if `check_input_term`
is called with the same `id` argument as the caller, it triggers
endless recursive call, resulting kernel space stack overflow.

This patch fixes the bug by adding a bitmap to `struct mixer_build`
to keep track of the checked ids and stop the execution if some id
has been checked (similar to how parse_audio_unit handles unitid
argument).

CVE: CVE-2019-15118

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 10ddec76f906..e24572fd6e30 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -81,6 +81,7 @@ struct mixer_build {
 	unsigned char *buffer;
 	unsigned int buflen;
 	DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
+	DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
 	struct usb_audio_term oterm;
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
@@ -709,15 +710,24 @@ static int get_term_name(struct mixer_build *state, struct usb_audio_term *iterm
  * parse the source unit recursively until it reaches to a terminal
  * or a branched unit.
  */
-static int check_input_term(struct mixer_build *state, int id,
+static int __check_input_term(struct mixer_build *state, int id,
 			    struct usb_audio_term *term)
 {
 	int err;
 	void *p1;
+	unsigned char *hdr;
 
 	memset(term, 0, sizeof(*term));
-	while ((p1 = find_audio_control_unit(state, id)) != NULL) {
-		unsigned char *hdr = p1;
+	for (;;) {
+		/* a loop in the terminal chain? */
+		if (test_and_set_bit(id, state->termbitmap))
+			return -EINVAL;
+
+		p1 = find_audio_control_unit(state, id);
+		if (!p1)
+			break;
+
+		hdr = p1;
 		term->id = id;
 		switch (hdr[2]) {
 		case UAC_INPUT_TERMINAL:
@@ -732,7 +742,7 @@ static int check_input_term(struct mixer_build *state, int id,
 
 				/* call recursively to verify that the
 				 * referenced clock entity is valid */
-				err = check_input_term(state, d->bCSourceID, term);
+				err = __check_input_term(state, d->bCSourceID, term);
 				if (err < 0)
 					return err;
 
@@ -764,7 +774,7 @@ static int check_input_term(struct mixer_build *state, int id,
 		case UAC2_CLOCK_SELECTOR: {
 			struct uac_selector_unit_descriptor *d = p1;
 			/* call recursively to retrieve the channel info */
-			err = check_input_term(state, d->baSourceID[0], term);
+			err = __check_input_term(state, d->baSourceID[0], term);
 			if (err < 0)
 				return err;
 			term->type = d->bDescriptorSubtype << 16; /* virtual type */
@@ -811,6 +821,15 @@ static int check_input_term(struct mixer_build *state, int id,
 	return -ENODEV;
 }
 
+
+static int check_input_term(struct mixer_build *state, int id,
+			    struct usb_audio_term *term)
+{
+	memset(term, 0, sizeof(*term));
+	memset(state->termbitmap, 0, sizeof(state->termbitmap));
+	return __check_input_term(state, id, term);
+}
+
 /*
  * Feature Unit
  */
-- 
2.17.1


--------------5C362557DFF1DBD4FF087E3A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------5C362557DFF1DBD4FF087E3A--
