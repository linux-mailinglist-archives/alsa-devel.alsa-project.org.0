Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130AAE4E3C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B561180A;
	Fri, 25 Oct 2019 16:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B561180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572012389;
	bh=xjcHD0Qi2kKRVPRx2mQ+O5icp5XKAliqsd+RkxY2vPY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLunQwTvtHHzEG3QnRLjD5uQjXfiWQLzWpXyCQaaTzgVR4Dcijs+YS8MfqvcwTVKh
	 Um6eL5Ge0hMI5KY5ff9hiBpT/Tg5RY+T5w4kRAZKijmtYRhRXOfzOV5Q9nSIOwUZI3
	 5kOIy6bRBO47P93vTxe2A1JlXGclAHJI1pjAQ+3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C209F803A6;
	Fri, 25 Oct 2019 16:04:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3CDFF8036F; Fri, 25 Oct 2019 16:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BEA9F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:04:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2ABDCA003F;
 Fri, 25 Oct 2019 16:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2ABDCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572012279; bh=BwbEUQiwYYYtgynoyoonYC1XzENqzlJtLkdvKmYC/OE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S596tg72s1MX6a0a083HTS2mI3nPMnEMzYweyOLQwzFRK2xYZyvfQ1nUIOvMG40a0
 z/ZFe4TfiGCzN49ZMPYbi52amNMZo9ObbAkTINub1xf2OZx3NmHAIxf2OJ3MgO9mfk
 pJpZqv7WHd1IjjijsDVOmF8y12atgMt10IlW8SFY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 16:04:34 +0200 (CEST)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20191025123038.19728-1-perex@perex.cz>
 <alpine.DEB.2.21.1910251542360.16459@zeliteleevi>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6b59a565-faf7-2b70-4e04-546a5ba507c3@perex.cz>
Date: Fri, 25 Oct 2019 16:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910251542360.16459@zeliteleevi>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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

Dne 25. 10. 19 v 14:44 Kai Vehmanen napsal(a):
> Hi,
> 
> On Fri, 25 Oct 2019, Jaroslav Kysela wrote:
> 
>> There is an inconsistency in the names for the HDMI/DP Jack control
>> names between some ASoC drivers and the HDA HDMI driver which
>> introduced this naming in 2011.
> 
> this will break a lot of existing devices that are using out-of-tree UCM
> files, so I'm not sure this is worth the effort.

I don't agree. The out-of-tree UCMs should go to upstream anyway, except that 
they are unusable for the standard users.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
