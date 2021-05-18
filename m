Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D3387F32
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 20:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F911789;
	Tue, 18 May 2021 20:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F911789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621360965;
	bh=yK00D6HHYlS6n1b5uDSWMhkz0GyC+qCJ98qUNlQediU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jiMRDwUbz0y0P528CfXhsGOF8lCyJneOCbp99z7SCIrhM/A7SWS7Vpqvmg5WUxOzh
	 YVmnUHR6CQerTPFfv7JhFwcoJmJ/gw2Wh6tQynmTj2ytB6JERzDA0pUkC2cMPPHMYZ
	 WaOOJlnEQla083Vuhp0wChJ5SMd2MV7doz4aGlvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA949F80430;
	Tue, 18 May 2021 20:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FC68F8042F; Tue, 18 May 2021 20:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE1F8F8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 20:01:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 96C25A0042;
 Tue, 18 May 2021 20:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 96C25A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621360896; bh=xnVyYdaRpoJxD35yu28CMvjpZH32GS+4Kx08EJNcOn4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ino59mjaAbiIOxfqNhhv7mbpxXFBjswyCKGcSI4aLXewr+oOj0SxDdLz9DQle1Hbg
 /UByGO/QgHLn1VbDpOrPQwB0ewkZSCw2+mfCCRimrWL702427x92+i9FAs/cQOW4iW
 X6AJ6SCXNhWQLHSd6ufi//+j0RmjQWRLhfm84Cag=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 18 May 2021 20:01:33 +0200 (CEST)
Subject: Re: [PATCH 5/7] ALSA: control: Track in-flight control read/write/tlv
 accesses
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210518165201.24376-1-tiwai@suse.de>
 <20210518165201.24376-6-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <90b6bbc4-9e97-6bfd-10a9-ab68aa8935f4@perex.cz>
Date: Tue, 18 May 2021 20:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518165201.24376-6-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

Dne 18. 05. 21 v 18:51 Takashi Iwai napsal(a):

> +/**
> + * snd_power_sync_ref - wait until the card power_ref is freed
> + * @card: sound card object
> + *
> + * This function is used to synchronize with the pending power_ref being
> + * released.
> + */
> +void snd_power_sync_ref(struct snd_card *card)
> +{
> +	wait_event(card->power_ref_sleep, !atomic_read(&card->power_ref));
> +}
> +EXPORT_SYMBOL_GPL(snd_power_sync_ref);

Perhaps, this function can be inline, too?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
