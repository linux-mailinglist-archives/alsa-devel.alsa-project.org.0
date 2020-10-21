Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62F294950
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 10:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5326E16D2;
	Wed, 21 Oct 2020 10:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5326E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603268713;
	bh=EPP935MPUrpuzprv70hW8ipua1fJwkpsl28fbpIyq+E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFS21gPQS5IKx5M/rUtbwlNmNGlD5j4+fcjvq0yQAe1Q2VaSZbK9gyj7H3xl4IOOS
	 caPeUSxiDpW4j+xzCDQ27/nTzbOM1CoaFz0WE/XhkfOD5BFOyBZ0wgDRh+M9qyHVB3
	 g9jeeHOgDTmsBy0ZBWEX4TNd/dxHn/0QFvOL/O6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CDDF8026F;
	Wed, 21 Oct 2020 10:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C819F80264; Wed, 21 Oct 2020 10:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 770EFF80247
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 10:23:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1D5FFA003F;
 Wed, 21 Oct 2020 10:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1D5FFA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1603268603; bh=Y1iJ/N45CN1KRkNT9SnOm7GBc2M+tovomXTMjXL6/+E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eIs8iUYHcOiiMRXMp3f24oG5XL9N1xoiXMiALT53zstMrVaCott9kkmZtNGEksy4j
 EEIzhLPyyHR9/dhbpFFUMg7RNK66LAgj4SAva8UlIsum9pQL91UtWHylQWWJYkHF9C
 iQ3lR/P//5YATWkLsRglhrDKe8bmeUMC4rud4fzw=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 21 Oct 2020 10:23:18 +0200 (CEST)
Subject: Re: [GIT PULL] ASoC updates for v5.10
To: Mark Brown <broonie@kernel.org>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
 <20201012132857.GC4332@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
Date: Wed, 21 Oct 2020 10:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012132857.GC4332@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

Dne 12. 10. 20 v 15:28 Mark Brown napsal(a):
> On Mon, Oct 12, 2020 at 03:16:18PM +0200, Jaroslav Kysela wrote:
>> Dne 12. 10. 20 v 15:08 Mark Brown napsal(a):
> 
>>> ASoC: Updates for v5.10
> 
>> I miss the SOF cleanups here:
> 
>> https://lore.kernel.org/alsa-devel/20200930152026.3902186-1-kai.vehmanen@linux.intel.com/
> 
> Yes, looks like they didn't make it.  Nothing looks particularly urgent
> in there.

Another week and this is ignored. At least, I cannot find this simple patch
set in your for-5.10 tree. I don't care about the cosmetic code fixes, but the
last warning suppression can reduce the maintainer / user confusions ("ASoC:
SOF: loader: handle all SOF_IPC_EXT types").

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
