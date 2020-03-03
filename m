Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CDE177921
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 15:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C30571682;
	Tue,  3 Mar 2020 15:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C30571682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583246197;
	bh=5HLphgfoAp5hxc33Hyu3pkUVc4DKx/1Imqw5QOPmuoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8nVvgzqCDSq8JOs+BoHxAZ8vjvg+vRpcUg+FBvQQtdG6qTOL6s9bNohfpAmPkduM
	 oAhjgUM89Mbl38w41OVr0CnGCEcQwtlQgAnNvcm2T8pJpnEEyURhOyqSbrNxPkxf6u
	 o9U7NdWwCyBD3ALOLwXD/fgpP9u/G0o1ZaMH5koI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03C3F80131;
	Tue,  3 Mar 2020 15:34:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37513F8025F; Tue,  3 Mar 2020 15:34:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6361FF80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 15:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6361FF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wj7clo3b"
Received: by mail-pg1-x541.google.com with SMTP id s2so1617876pgv.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Mar 2020 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A9r1rdjgxdujZHKdyrajsLeH9QBeHgW4Z+0FAe0pOxM=;
 b=Wj7clo3bjugnZLLN8cUphbm9TO23s/7v9ldR/lHR892/Nl683ZqPpvT2w4auQw4BVK
 /h5o2JcYFH/nx5+tY8XkcUgV7oD/OnLEg4HJOrTVPl5IdKkj31qvttGeKv4cK8v8XLx6
 yLZRzLwLfTVd3agskOtEJ3eMAEruzXKCvcYwrk/C43G5YDsoKzDBoLNgaQcP3HhFQyuu
 fdfoLh8C5/jqtkWa+vZJgSOXpwpPnMRezM6JO0cmuByL0BFMKeb7QRx6X1RbPm6eUUPL
 ywwi2qJzPm23k/NyJ0gK5zepUy7PNG/Pd/p6X6XNqzH5yz47gKjzX1ZwMXOEmkUcQoyZ
 9jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=A9r1rdjgxdujZHKdyrajsLeH9QBeHgW4Z+0FAe0pOxM=;
 b=LHMNdRLPSLaQq6RoLwB2xWw86h1qlQJ6nYQaPCrSk8xVEIV04VZXWndwsOhRAt7fBl
 hbvPzLbVWYtDZ2xIPyfyUv/K51Dfc/DHvC1uKXU2bB8e6XAUFaCXBYkskpyYlND+ZhKa
 0splkXtNCwWEyoST+6GAbNeFs5U490YDa7jY6CGJMSpERoJOrBVaeqEVCFM4jQLx/dhU
 Fen6QiiiwkPdYmOUIn/WU8Uao5oY1eZtxDdhonZRp4KyZtWs5lkzU2wu3NOtS5u1bxTM
 iN22aDYgWhVxMQj7AAQBtqJoLatqlC711HkCoJ6C+aBfajZaoCMgjoGHHspHzCJuDbH8
 6gdg==
X-Gm-Message-State: ANhLgQ3xB5FY+phhoVRMkjIxUQlW1bt7sLYdDguPjhxdGpCZd+PsqL48
 267PkMBBuWOBYgIC0MZWD+k=
X-Google-Smtp-Source: ADFU+vvSX/wgDsqEEwAqbDZltsO3GyJEnBAqz5YJ8pdU+azKUfszCRTdwImCImdr9VODUOMIAe/W5Q==
X-Received: by 2002:aa7:86cd:: with SMTP id h13mr349892pfo.252.1583246086518; 
 Tue, 03 Mar 2020 06:34:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m15sm23947712pgh.80.2020.03.03.06.34.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Mar 2020 06:34:45 -0800 (PST)
Date: Tue, 3 Mar 2020 06:34:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
Message-ID: <20200303143444.GA25683@roeck-us.net>
References: <20200224112537.14483-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224112537.14483-1-geert@linux-m68k.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
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

On Mon, Feb 24, 2020 at 12:25:37PM +0100, Geert Uytterhoeven wrote:
> On i386 randconfig:
> 
>     sound/soc/codecs/wm9705.o: In function `wm9705_soc_resume':
>     wm9705.c:(.text+0x128): undefined reference to `snd_ac97_reset'
>     sound/soc/codecs/wm9712.o: In function `wm9712_soc_resume':
>     wm9712.c:(.text+0x2d1): undefined reference to `snd_ac97_reset'
>     sound/soc/codecs/wm9713.o: In function `wm9713_soc_resume':
>     wm9713.c:(.text+0x820): undefined reference to `snd_ac97_reset'
> 
> Fix this by adding the missing dependencies on SND_SOC_AC97_BUS.
> 

With this patch applied, arm:pxa_defconfig reports a variety of unmet
SND_SOC dependencies, and it fails to build.

ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undefined!
ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!
ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undefined!

Reverting this patch fixes the problem.

Guenter
