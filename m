Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935BD2E311D
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 13:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2168B16B0;
	Sun, 27 Dec 2020 13:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2168B16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609072705;
	bh=Zq31zFHPAejFpYMdmk0/n6ANOwd0NflivzfL+kVwhnk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tA8CXlksGHUscHGvqchVZTdSkhs4LoiRmL5rGFM/Sm896tqJR3WGTN0nlEt/SQw6C
	 XAURc7wgyRJ2PDUsjuYmYgKMgS4KPbzSZY6p95pHguHJ8rn1xrFntwUjhCCq9Op7nu
	 2Lz7IvlNKtNIxwhDFzV0XDGP70E4sMcNpOkzYZUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB43F80169;
	Sun, 27 Dec 2020 13:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2911F8022B; Sun, 27 Dec 2020 13:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94340F80169
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 13:36:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E2562A0042;
 Sun, 27 Dec 2020 13:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E2562A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1609072594; bh=clOK/M9bsDQTn7/dkNi0ajgzodqaLaHNXHDLSk7IcMQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3fm0v1VL/U0brqQ4HzFIDbDH4aUt2Az9LoOI8L7D/Uo/hcugXXTc9pYui/icSZtkM
 ZxE74XYG4s0RVk2i0jlhUkGLHLZoquV8IKjZ9RH9V5j0DGWPG6MAsxs3aF8MgGQhXq
 7PZt9G/Qrl4BDlHe0JE0ys+eTZaDOzxD1VyYHw4o=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 27 Dec 2020 13:36:31 +0100 (CET)
Subject: Re: [PATCH 8/9] pcm: fix undefined bit shift in bad_pcm_state
To: Takashi Iwai <tiwai@suse.de>, Alex Henrie <alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
 <20201226213547.175071-9-alexhenrie24@gmail.com>
 <s5hy2hjejgb.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f4f03e79-5e0a-a306-09f1-a3f5ef46c7b0@perex.cz>
Date: Sun, 27 Dec 2020 13:36:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hy2hjejgb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 27. 12. 20 v 9:34 Takashi Iwai napsal(a):
> We need either to handle a special error value in all places calling
> __snd_pcm_state() or to just return SND_PCM_STATE_XRUN or such instead
> here, IMO.

I think that SND_PCM_STATE_OPEN is more appropriate here. If the state
callback is not defined, the state management is screwed anyway. The other
functions will return an error (because they depend on the state management),
so it's safe. I applied this change to repo.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
