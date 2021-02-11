Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588E3192EC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 20:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4198171F;
	Thu, 11 Feb 2021 20:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4198171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613071074;
	bh=fPDjM1EehdkXLKW3c9z5H+xt+dZbpq98pGB7h1LSXPs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuEK9lT7KrsVUdIAhdNyHLqJ+eJRHzJT2Bp5ASEzG1+AUDtm3SbWysvVvRquL7GUi
	 8iA7Pm8sJGoX41ueNQp9tCqY7fZqe7cIVqASShtUop0zIRPwA1FOy189pMILNbdMTE
	 wagM8KdRt8eOtnx6vyVvnGyZaU29PDxzOGohaKYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 101F1F801EB;
	Thu, 11 Feb 2021 20:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D93AF801D5; Thu, 11 Feb 2021 20:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4311F8014D
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 20:16:08 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 08072A0042;
 Thu, 11 Feb 2021 20:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 08072A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613070968; bh=9NSj7BcxujMB+nRIHP0gFBHEUcsNGmCr0UD+F8JPJb8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3peeUhBksdRP8Is4U32dutgH3WBy+PoNYWOmmkgl7+5hDQopGY8d43Azg9p5xOBHC
 6A1/tfVqxFxiv7RHKb8KC8LoYSe+MDGavfaYQL7FPndbvpiV4CNevcL1VJxgFR06OU
 Jcqr/JFf2mrQgfO/HqtmX3qStU+Dmhh9lTs3Dfe8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 20:16:04 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf] bytcr-wm5102: Add new UCM profile for BYT
 boards with a WM5102 codec
To: Hans de Goede <hdegoede@redhat.com>
References: <20210209190859.70997-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8025790a-e061-6ff6-8606-9f94eba1ba29@perex.cz>
Date: Thu, 11 Feb 2021 20:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209190859.70997-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 09. 02. 21 v 20:08 Hans de Goede napsal(a):
> Add new UCM profile for BYT boards with a WM5102 codec. This has been
> tested with both the SST and the SOF driver on a
> Lenovo Yoga Tablet 2 1051L.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The patch was applied to the alsa-ucm-conf repository.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
