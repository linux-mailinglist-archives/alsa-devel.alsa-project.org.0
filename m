Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238481042B5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5125174D;
	Wed, 20 Nov 2019 18:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5125174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272778;
	bh=2pCj08Co/xkwJWA3NKbTrArvEGwfonscMTg5eqfujs8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaIKSX2TFrZaaSqty8cJNcix6rNgfNyAxF1CfyhMoySgG20OiTA5EiCfeebTGe3G9
	 iDxaAtRFLP9U6BLN70wojK2oOxpqYnlHD7AJn3DfgrunRfEYXrvyQVDla8zNwxXcP5
	 xZ0E/eirQVKm62LWqB7GcSmlBO9nxPeE8C7RjJ00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68181F8015B;
	Wed, 20 Nov 2019 18:55:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28CFF8015A; Wed, 20 Nov 2019 18:55:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7BABF8014F
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:55:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3AAC6A003F;
 Wed, 20 Nov 2019 18:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3AAC6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574272526; bh=y3p5ChDtxvS52i9UvJnwQBhdE8+6pB/ZqxDnkGLZrTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mMtvClacAxmFiFRcaGxWs+kBqoJfWARcqd94KU1Ub253aQX+azLlZlqdbH0Ta1jE3
 JkuF3slRNno5O1aL831HDNGSmd/Y4Jir5eO9k4XMsQ3acmFsV0SXvTSTGPVLmHY3Dz
 /Ak2p8HNKznE04q7ZDdSJjUfC+rRrSiEJElKzNdA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 18:55:22 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191120072821.6648-1-perex@perex.cz>
 <20191120072821.6648-3-perex@perex.cz>
 <fc38f8f6-9cb8-0123-8f5e-6cf980b5f1d1@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f00e378e-7ff5-0a57-4687-0c2ee187b4c7@perex.cz>
Date: Wed, 20 Nov 2019 18:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <fc38f8f6-9cb8-0123-8f5e-6cf980b5f1d1@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: Intel - do not describe I/O
 configuration in the long card name
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

Dne 20. 11. 19 v 17:08 Pierre-Louis Bossart napsal(a):
> 
>> +config SND_SOC_INTEL_USER_FRIENDLY_NAMES
> 
> LONGNAMES?
> 
>> +	bool "Use more user friendly long card names"
>> +	help
>> +	  Some drivers might pass the I/O configuration through the
>> +	  soundcard's driver name in the control user space API. It may
>> +	  be used in GUI. If you do not like this and the user space
>> +	  does not depend on this (like UCM - Use Case Manager),
>> +	  then select "Y".
> 
> Sorry for being picky here, but I find the wording confusing with two
> negatives resulting in a Y.
> 
> maybe
> 
> Some drivers report the I/O configuration to userspace through the
> soundcard's long card name in the control user space AP. An unfortunate
> side effect is that this long name may also be used by the GUI,
> confusing users with information they don't need.
> This option prevents the long name from being modified, and the I/O
> configuration will be provided through a different component interface.
> Select Y if userspace like UCM (Use Case Manager) uses the component
> interface.
> If unsure select N.


Thanks, I used your text. The v3 patches are sent without the first one which 
is already merged to the Mark's tree.

					Thanks for review,
							Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
