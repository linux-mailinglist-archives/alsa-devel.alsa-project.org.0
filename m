Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318E10244F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 13:25:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1066F168D;
	Tue, 19 Nov 2019 13:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1066F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574166317;
	bh=LAzPmvKh04JrNPqIfVB42+R5rIu8r5gVUgeJrx5eCqw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhOC1MVRwHlYSixrQmnbBbg8jf6Uz3vmxYsKrCePOMULz3Wj8cHmtOPTxQPD8YwSZ
	 Y1zTsxNgeH4bSDUUx/91ooiAb6eY8zh79yWvVIuK6SycG6qAoHTY131RMjquh3f7OO
	 IhX4g5AGXOyV9H+HoUBtXdFifwg4ANo95qMZWG/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EFA8F80135;
	Tue, 19 Nov 2019 13:23:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756AAF80137; Tue, 19 Nov 2019 13:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01051F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:23:27 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 06026A0042;
 Tue, 19 Nov 2019 13:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 06026A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574166207; bh=DOE9e5xx2nzRaQDY9PzbpFYsTiWVguSX0E+RuAp2cHM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c2Mi7aPzAM2kOOdhRHgWOL4yDqQ3409qSWyZ7I57JCY8dstzQ6HS6Io1vrbRTwdIT
 bxs2I4f6YOj6JfJd66w9kbC1AwvXQoPvP8hZI5lkoE4ip1UMF6K86sGeJSVgNadL0+
 wkPF3i5s6QGma/G5aW+GxFKa1ng1aSUSJZbHi9P4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 13:23:22 +0100 (CET)
To: Hans de Goede <hdegoede@redhat.com>
References: <20191119104822.15053-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
Date: Tue, 19 Nov 2019 13:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119104822.15053-1-hdegoede@redhat.com>
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

Dne 19. 11. 19 v 11:48 Hans de Goede napsal(a):
> Prior to commit aba2260ae7b5 ("ucm: switch to ucm2 directory and v2 format,
> keep backward compatibility").
> 
> The filename build in parse_verb_file() was build like this:
> <prefix>/<uc_mgr->conf_file_name>/<file>
> 
> Where uc_mgr->conf_file_name would contain either the card_name or the
> card's longname depending on the detection of a longname based config in
> uc_mgr_import_master_config().
> 
> While the filename used in load_master_config() was build like this:
> <prefix>/<card_name>/<card_name>.conf
> 
> And uc_mgr_import_master_config() first calls load_master_config()
> with the card's longname and if that succeeds it overwrites
> uc_mgr->conf_file_name with the longname so that the subsequent uses
> of uc_mgr->conf_file_name in parse_verb_file() correctly use the longname.
> 
> But the new configuration_filename() helper added in commit aba2260ae7b5
> _always_ builds the filename like this:
> <prefix>/<uc_mgr->conf_file_name>/<file><suffix>
> 
> This breaks the loading of the master-config by its longname, as when
> the longname is tried uc_mgr->conf_file_name still contains the card_name.

Hi Hans,

This new behaviour was intended for ucm2. I applied all four your patches, and 
added 10a63e093c4a98acfa9bcdfdd06938bcd874b008 on top which should keep the
new behaviour for v2 configs.

It's time to create the 1.2.1.1 bugfix alsa-lib release, I guess.

			Thank you,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
