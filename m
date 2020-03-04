Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01117941E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 16:55:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1199F1662;
	Wed,  4 Mar 2020 16:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1199F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583337320;
	bh=8kQ4/Jfb9LXZDBTdTrOD0uXp2amYpNh5ANazP+uFltA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FU/UHi207YMpRYvlsTyF3QbUPiL1452zUlMJdmTxA5dCAtQv/tc1Ug4ONKTgvMD9l
	 uMi9qFqIz+lzDizeDYQe4k5bhbK2M5qZVbNfrseQt8A0LwCeL1Bn3XVuVhJbu6/bbF
	 lb0mRKk/KC+NLDEnq/3BJEZAlSgsI6PjwDiotzzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 208F0F8012D;
	Wed,  4 Mar 2020 16:53:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A527DF801ED; Wed,  4 Mar 2020 16:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D274F8012D
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 16:53:34 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 37EF8A0042;
 Wed,  4 Mar 2020 16:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 37EF8A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583337214; bh=8SBxtxpHwSLRC2CbYe+Q730Ys/1ADQK9is9B9mt3J5M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XTLpF1o6y/U7MbxAjYukq2Y8c+BdeO7aC2HMS5rgFZBJ8G5dufbd/Ykr5uggGJxW7
 +6ziAslGoqjpEVIDMaLxtHM0wMre1x1snlHogYgdtNMx8wNAhoFTBsHcG8FsOb9SaH
 2vJg1LqXJdH+qOKjNU4sn99WZ97YugR0wb2CMBG8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  4 Mar 2020 16:53:28 +0100 (CET)
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
To: Mark Brown <broonie@kernel.org>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
 <20200304154450.GB5646@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
Date: Wed, 4 Mar 2020 16:53:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304154450.GB5646@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

Dne 04. 03. 20 v 16:44 Mark Brown napsal(a):
> On Wed, Mar 04, 2020 at 04:25:54PM +0100, Jaroslav Kysela wrote:
>> Hi,
>>
>>    could we cherry-pick patch 8cd9956f61c65022209ce6d1e55ed12aea12357d to the
>> 5.5 stable tree?
>>
>> 8cd9956f61c65022209ce6d1e55ed12aea12357d :
>>   "ASoC: intel/skl/hda - export number of digital microphones via control
>> components"
> 
> This looks more like a new feature than a bug fix and I've been trying
> to get the stable people to calm down with the backports, there's been
> *far* too many regressions introduced recently in just the x86 stuff
> found after the fact.  Does this fix systems that used to work?

The released ALSA UCM does not work correctly for some platforms without this 
information (the number of digital microphones is not identified correctly).

The regression probability is really low for this one and we're using it in 
Fedora kernels for months without issues (in this code).

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
