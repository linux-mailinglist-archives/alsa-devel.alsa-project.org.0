Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E01409C8B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 20:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4EC1790;
	Mon, 13 Sep 2021 20:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4EC1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631559172;
	bh=Utsoz/baYgDIEtwJZHNZtk91W//cpdR8B4DrxXJBctk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5mLLrpCgcBIdEmcF7t6A7ZqPOifG5gy3x2v/96++cjcFeCdeBze00P4iyvRyUZFo
	 0N0K8uSYb0UsZZZGjg1SzGKBTG9+a59ode87oPr54xNFKeCx60e5oH+95Pq7wHOCCE
	 1++SWFzneuM9Jelvx4hx96Lw/mDZNsWj7moTFuf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32CDCF80132;
	Mon, 13 Sep 2021 20:51:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 921F6F80132; Mon, 13 Sep 2021 20:51:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFC2AF80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 20:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFC2AF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="fAsnMcY7"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 553bbde3;
 Mon, 13 Sep 2021 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=subject:to
 :cc:references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=EHBh3Xzua5iqPz4
 9NnjE1R24WyY=; b=fAsnMcY7Mn0cwgCN3RAMm1entis9CGUF0ApcPqSirG2PPs/
 zghnPPV5eMvdhOtk+fZF0HUbCEtu18Fqr/Vv+dDlJDXcN5pwrx3++Dbvel3VAArz
 niVUQheL7azwqUO0B5wyB/9FfGL6gpb6EYXOAettro4zLH3A88FrDwXQXZAI=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 479b7281
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Sep 2021 11:51:24 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: Quirks to enable speaker output for
 Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
To: Takashi Iwai <tiwai@suse.de>
References: <20210912230715.156221-1-cam@neo-zeon.de>
 <s5hy281jb7l.wl-tiwai@suse.de>
 <e1c633dc-570f-d06a-51cb-bdfd0c1a2549@neo-zeon.de>
 <s5hzgsgirt2.wl-tiwai@suse.de>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <3aefa356-668b-b33f-86fd-10ef9ad09111@neo-zeon.de>
Date: Mon, 13 Sep 2021 11:51:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hzgsgirt2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Alas,

Changing to:
spec->gen.suppress_auto_mute 0 =1

Results in audio output from the speakers after removal of the headset. Any ideas why or what we might do?

I'll changing the "Auto-Mute Mode" to confirm what happens when using:
spec->gen.automute_speaker = 0;

Thanks!



On 9/13/21 5:27 AM, Takashi Iwai wrote:
> This flag is effective only until "Auto-Mute Mode" mixer control is
> changed, so it's not persistent.  If you'd need to disable the
> auto-mute feature, set spec->gen.suppress_auto_mute=1 instead.

