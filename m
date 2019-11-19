Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA11024B3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 13:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5815F1692;
	Tue, 19 Nov 2019 13:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5815F1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574167333;
	bh=2QKcIG7nqc+nvs6HPfa2dVhv75CdoWZpZiMADYYRMo0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIKlQbBBT72KQfFDlxR33hXYlEVzLGOusiQwGekFdD5MPy+VcdiZrVRzq7oLlgNNL
	 26WUSoX/EWTi8cXV8qhSvW+hEBKbPkCh0ek8Yf7pxJefmr+68bVBOIlT2Lf9giC972
	 206rbLeQDTg5/rKf95/RjEhz6o9MngaUYcv6Uguo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A07FDF80139;
	Tue, 19 Nov 2019 13:40:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C32BF80137; Tue, 19 Nov 2019 13:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528B6F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528B6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cOYu9u0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574167221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8dG8pQmqdOAd32VYhRMv+H+JfwAgyMiOB99uKoZkfI=;
 b=cOYu9u0lnsU+ZSjGPYMJRWLkuejLa6Aa3R5IyC/yCwmQTILMkL0UKnonqcm5qOUTkuvwHU
 rnlEGhxhsVLTaOnC1Bz7XhRsOV8VbDKyQvu2K2jMJxS6z4fjYY4l8tcIh8WVtqzxYqOv/9
 wNYx1ydXHcYoxPEbbarc3tSEGqsoZ7g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-82k4EYtjNhy_sGMih-dDzw-1; Tue, 19 Nov 2019 07:40:19 -0500
Received: by mail-wr1-f70.google.com with SMTP id e3so18168697wrs.17
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=toijVbxWo88NCe2k35wiICeOWX+gbwdXN0HpfG9KTvA=;
 b=Aco8DmlqCCgMTPMR2c3dSxtM0Qmmi2oV/gHFXnYAR4OHqOrDP8o2O0RZd+0nLKaleg
 GYXB3pybMH7J3+f8097Sz5fVizNNBfj0cYqVD0LcUQph6zNYa4a6OcN6bRGVlS6AaGo7
 xogJ6tCjnsoD2qwYx0weKPG23IsgjR1Ebsj461+cLADITdQhayv7dz6Oi0TJ9lXTwBqt
 mECvLyUEak9bEHPQ27QOIxqvF9lQzAtWT23BxmcCBRzQpGSzBcOlghag1qqAOjjdROtc
 +uu849uht4rlx+ZfOlJWFjVi66+P6bskb3oAa/Wz5Mkq7bH0eRiBn7izBlchzI8D3aiR
 JPOg==
X-Gm-Message-State: APjAAAUIix4X4yk/JVawc96CGDqD0CwesA06/JDUSSQ2LRQjQCNGp+Tr
 4MDD/JlYdkZ4JDOd2PbBbf7S15FB/mt0cusThQcZkUPAA++UKG1etH6/BBqi7mHuvUwKQlewXdk
 DkAIgYmJc9ybFMCcgtsrr0iI=
X-Received: by 2002:a1c:7e91:: with SMTP id z139mr5433631wmc.15.1574167218379; 
 Tue, 19 Nov 2019 04:40:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqydP1ohZQiLhddDqhYTds2c3STBCo1c16WwPWIfwP5T2FIZP00fuEqaP+BuFRgXUeTunBNfjA==
X-Received: by 2002:a1c:7e91:: with SMTP id z139mr5433601wmc.15.1574167218125; 
 Tue, 19 Nov 2019 04:40:18 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id w19sm2902359wmk.36.2019.11.19.04.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 04:40:17 -0800 (PST)
To: Jaroslav Kysela <perex@perex.cz>
References: <20191119104822.15053-1-hdegoede@redhat.com>
 <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <56edc7da-ba0f-1ffe-6b31-6eb6b570580d@redhat.com>
Date: Tue, 19 Nov 2019 13:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
Content-Language: en-US
X-MC-Unique: 82k4EYtjNhy_sGMih-dDzw-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH alsa-lib 1/4] ucm: Fix opening of
 master-configs by the card's longname
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 19-11-2019 13:23, Jaroslav Kysela wrote:
> Dne 19. 11. 19 v 11:48 Hans de Goede napsal(a):
>> Prior to commit aba2260ae7b5 ("ucm: switch to ucm2 directory and v2 format,
>> keep backward compatibility").
>>
>> The filename build in parse_verb_file() was build like this:
>> <prefix>/<uc_mgr->conf_file_name>/<file>
>>
>> Where uc_mgr->conf_file_name would contain either the card_name or the
>> card's longname depending on the detection of a longname based config in
>> uc_mgr_import_master_config().
>>
>> While the filename used in load_master_config() was build like this:
>> <prefix>/<card_name>/<card_name>.conf
>>
>> And uc_mgr_import_master_config() first calls load_master_config()
>> with the card's longname and if that succeeds it overwrites
>> uc_mgr->conf_file_name with the longname so that the subsequent uses
>> of uc_mgr->conf_file_name in parse_verb_file() correctly use the longname.
>>
>> But the new configuration_filename() helper added in commit aba2260ae7b5
>> _always_ builds the filename like this:
>> <prefix>/<uc_mgr->conf_file_name>/<file><suffix>
>>
>> This breaks the loading of the master-config by its longname, as when
>> the longname is tried uc_mgr->conf_file_name still contains the card_name.
> 
> Hi Hans,
> 
> This new behaviour was intended for ucm2. I applied all four your patches, and added 10a63e093c4a98acfa9bcdfdd06938bcd874b008 on top which should keep the
> new behaviour for v2 configs.

Ah I see.

There is a bug in the commit you added on top though,
when load_master_config() gets called with longname == 1
and ALSA_CONFIG_UCM2_VAR is not set and ALSA_CONFIG_UCM_VAR
is set, then the if condition in the block is false, so it never executes:

+               if (getenv(ALSA_CONFIG_UCM2_VAR) || !getenv(ALSA_CONFIG_UCM_VAR)) {
+                       uc_mgr->conf_format = 2;
+                       configuration_filename(uc_mgr, filename, sizeof(filename),
+                                              uc_mgr->conf_file_name, card_name, ".conf");
+               }

Causing the next block to also not execute:

+               if (uc_mgr->conf_format >= 2 && access(filename, R_OK) != 0) {
+                       /* try the old ucm directory */
+                       uc_mgr->conf_format = 1;
+                       configuration_filename(uc_mgr, filename, sizeof(filename),
+                                              card_name, card_name, ".conf");
+                       if (access(filename, R_OK) != 0)
+                               return -ENOENT;
+               }

Causing load_master_config() to continue with an uninitialized filename.

I think you wanted the following condition for the second block:

                 if (uc_mgr->conf_format == 0 || access(filename, R_OK) != 0) {

Also don't you want the same behavor wrt forcing the conf_format based
on env. when trying the shortname ?

I think you can move the entire block under if (longname) to be unconditional,
since conf_file_name == card_name for the shortname case using the longname
path in the shortname case too is fine. Then you always call configuration_filename
with conf_format set and all the handling for conf_format not being set (and
for overriding it) can be dropped from configuration_filename() then.

> It's time to create the 1.2.1.1 bugfix alsa-lib release, I guess.

Yes that is a good idea (once the above is resolved).

Regards,

Hans

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
