Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51530AB7D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:34:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBB01766;
	Mon,  1 Feb 2021 16:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBB01766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612193663;
	bh=fvCTfVpAuqciI+P5y/yw6sVzUurzRvPuM0bij518BIU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sN5qSaG1svy2/dj1+qjKPbuct2VmK6EqUF+c3qK86kkDATGh5nQN3CwkThp0hFR3V
	 lFoJMw9q9/jNNj4iCy27zPOba+wtSuyhnRMzERbnVGrlthdB+Q9sRJ4i5LqL7deW3e
	 xHRUdcieahS6sDpriqLx8hQiXoMDo9w1VrgAME0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77901F80154;
	Mon,  1 Feb 2021 16:32:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0CBAF80153; Mon,  1 Feb 2021 16:32:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99F80F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:32:40 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A423FA003F;
 Mon,  1 Feb 2021 16:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A423FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612193559; bh=vook9S95R4XlCekIfIeCMgXoGME9PK1gz2eShg9fY8U=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=vc55kyEVs8Us++TLKtI/SYCR+aRC5wxKHsqlTLXvMmBGCPOSsx4q0GPqkOFDX21Lj
 62/h4r22vmexZ5cbvAUJZzAz8+cMZugbfhthQjwB/x5nvNgX1WERvrX5uzA8v09AMb
 Sds5DpR0FnZQn1QS9Ow62xpXEALSFd+eTa9b8zok=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  1 Feb 2021 16:32:36 +0100 (CET)
Subject: Re: [PATCH] Add support to expose controls of ladspa plugin
To: Camel Guo <camel.guo@axis.com>
References: <20210201150352.6342-1-camel.guo@axis.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c94055e4-20f0-f4d5-8aa2-26d99fa30486@perex.cz>
Date: Mon, 1 Feb 2021 16:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201150352.6342-1-camel.guo@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 01. 02. 21 v 16:03 Camel Guo napsal(a):
> From: Camel Guo <camelg@axis.com>
> 
> In order for external software components to adjust ladspa plugin
> dynamically, this commit adds an option to exposes the control array of
> input control ports of a ladspa plugin to a file, through which any
> applications with proper permission can control this plugin.

It looks like a pure hack (although the implementation is interesting). The
controls may be exposed via the ctl (control) API like we do in
src/pcm/pcm_softvol.c for example. The floats can be mapped to integer64 or we
may discuss to add the float type to the control API elements.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
