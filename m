Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65710254E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 14:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EFC1168F;
	Tue, 19 Nov 2019 14:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EFC1168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574169778;
	bh=4ZjnNsLFtApu8k3eWr4qRe6o1B+oOeSab7oDpwsMAHw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmFJ62Vqnq5xakePxeMTPqVjqkarOEv20jbGeoREhfvycz5+AQOxjMS4sPsjnpjks
	 MIxN/pt02/2wmEOjFpg1qUEaYvcnsfv6GdZhipKr42KFvRom6BOWXgKONL/C6TtzIX
	 cShVxDwa+QRGYAkRPm1X6a3of75MKlH62YMgY+wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC14BF80145;
	Tue, 19 Nov 2019 14:21:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 058DBF80138; Tue, 19 Nov 2019 14:21:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94CA5F80135
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 14:21:10 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AFE4FA003F;
 Tue, 19 Nov 2019 14:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AFE4FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574169669; bh=WEE3Zrjty1AmuPTtluDHYO8xRAUe8o+WgtrWp3iSAC4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AOz5Z8B0lfMrcUKXH1VyUgva1NQakemD5T20Q+ZKPwiINxOSir/GP+axkV48P32Fc
 JwRk14En0wsJnF31H35Aw7696CVzTndNF2pthXliBFfa6h85GrEt0HhHp8S5K8CAYv
 f/HL/WHqsmBmRevLUPCjHc0Abjw+5pBgtzukcpu0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 14:21:05 +0100 (CET)
To: Hans de Goede <hdegoede@redhat.com>
References: <20191119104822.15053-1-hdegoede@redhat.com>
 <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
 <56edc7da-ba0f-1ffe-6b31-6eb6b570580d@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8d5a2fa8-9294-bee4-1cef-24bcf2c325a9@perex.cz>
Date: Tue, 19 Nov 2019 14:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <56edc7da-ba0f-1ffe-6b31-6eb6b570580d@redhat.com>
Content-Language: en-US
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

Dne 19. 11. 19 v 13:40 Hans de Goede napsal(a):
> Hi,
> 
> On 19-11-2019 13:23, Jaroslav Kysela wrote:
>> Dne 19. 11. 19 v 11:48 Hans de Goede napsal(a):
>>> Prior to commit aba2260ae7b5 ("ucm: switch to ucm2 directory and v2 format,
>>> keep backward compatibility").
>>>
>>> The filename build in parse_verb_file() was build like this:
>>> <prefix>/<uc_mgr->conf_file_name>/<file>
>>>
>>> Where uc_mgr->conf_file_name would contain either the card_name or the
>>> card's longname depending on the detection of a longname based config in
>>> uc_mgr_import_master_config().
>>>
>>> While the filename used in load_master_config() was build like this:
>>> <prefix>/<card_name>/<card_name>.conf
>>>
>>> And uc_mgr_import_master_config() first calls load_master_config()
>>> with the card's longname and if that succeeds it overwrites
>>> uc_mgr->conf_file_name with the longname so that the subsequent uses
>>> of uc_mgr->conf_file_name in parse_verb_file() correctly use the longname.
>>>
>>> But the new configuration_filename() helper added in commit aba2260ae7b5
>>> _always_ builds the filename like this:
>>> <prefix>/<uc_mgr->conf_file_name>/<file><suffix>
>>>
>>> This breaks the loading of the master-config by its longname, as when
>>> the longname is tried uc_mgr->conf_file_name still contains the card_name.
>>
>> Hi Hans,
>>
>> This new behaviour was intended for ucm2. I applied all four your patches, and added 10a63e093c4a98acfa9bcdfdd06938bcd874b008 on top which should keep the
>> new behaviour for v2 configs.
> 
> Ah I see.
> 
> There is a bug in the commit you added on top though,
> when load_master_config() gets called with longname == 1
> and ALSA_CONFIG_UCM2_VAR is not set and ALSA_CONFIG_UCM_VAR
> is set, then the if condition in the block is false, so it never executes:
> 
> +               if (getenv(ALSA_CONFIG_UCM2_VAR) || !getenv(ALSA_CONFIG_UCM_VAR)) {
> +                       uc_mgr->conf_format = 2;
> +                       configuration_filename(uc_mgr, filename, sizeof(filename),
> +                                              uc_mgr->conf_file_name, card_name, ".conf");
> +               }
> 
> Causing the next block to also not execute:
> 
> +               if (uc_mgr->conf_format >= 2 && access(filename, R_OK) != 0) {
> +                       /* try the old ucm directory */
> +                       uc_mgr->conf_format = 1;
> +                       configuration_filename(uc_mgr, filename, sizeof(filename),
> +                                              card_name, card_name, ".conf");
> +                       if (access(filename, R_OK) != 0)
> +                               return -ENOENT;
> +               }
> 
> Causing load_master_config() to continue with an uninitialized filename.
> 
> I think you wanted the following condition for the second block:
> 
>                   if (uc_mgr->conf_format == 0 || access(filename, R_OK) != 0) {
> 
> Also don't you want the same behavor wrt forcing the conf_format based
> on env. when trying the shortname ?
> 
> I think you can move the entire block under if (longname) to be unconditional,
> since conf_file_name == card_name for the shortname case using the longname
> path in the shortname case too is fine. Then you always call configuration_filename
> with conf_format set and all the handling for conf_format not being set (and
> for overriding it) can be dropped from configuration_filename() then.

Thanks again, fixed in 1d848ab739f0d207098627d2ba66421b3ec75eeb .

> 
>> It's time to create the 1.2.1.1 bugfix alsa-lib release, I guess.
> 
> Yes that is a good idea (once the above is resolved).

The tar ball is in ftp://ftp.alsa-project.org/pub/testing .

				Jaroslav

> 
> Regards,
> 
> Hans
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
