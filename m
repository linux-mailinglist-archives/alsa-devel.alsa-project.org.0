Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6422E8605
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jan 2021 02:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD7716A4;
	Sat,  2 Jan 2021 02:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD7716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609550728;
	bh=FMHb9QAyYttgipB8eYWrnYvfJ+prGDQGzNUNEYzedX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BAX96JbC9WfURFCCyvRVfXVxZULkslkZvEe63qiPIF61M67/4Ka9ekAR0jmMlV1JZ
	 7yWsKtquTz3LkeEV9zOGWFh8PW9Hu9cfh2kJkyWPf/51A5sc32CxnMo1udX/nsIJ7A
	 3T9VNbT6bJzGvMlmjKM/eNeVAwa50U8W9tet1W98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A10F800B7;
	Sat,  2 Jan 2021 02:23:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 476B8F801F5; Sat,  2 Jan 2021 02:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.archlinux.org (mail.archlinux.org
 [IPv6:2a01:4f9:c010:3052::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB89FF800B7
 for <alsa-devel@alsa-project.org>; Sat,  2 Jan 2021 02:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB89FF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="Mho4fl0/"; 
 dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="j7XazsnP"
X-Gm-Message-State: AOAM531F5qYwoqPn6Ij+5pyKalwI3UXQBPiZ69+9rEqUeX4x0xyb+hnL
 8VcSqGeW21YdwScE1unV7O+SwstUku3EP5sKXfw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-rsa; t=1609550617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMHb9QAyYttgipB8eYWrnYvfJ+prGDQGzNUNEYzedX4=;
 b=Mho4fl0/3aX+dUta8eEe21bKvq8fvf+5SR8COv1W2KffPqIe0TFeo2F+Aw/P5iv14dotey
 p9ohFdwJeCsspnXFhfqrzGfjGZOmBko++7VxyeVHk2In4fEEW109v8Sm1eoNhFGfTZerwu
 dUGINFtLSZCDvwc6DGoKOTakcui2y7KiNeWWZZWnAKBxZiSfVYBd2KfCDzH/Y5f8dzEiDs
 mJiniSRZLED7bo+b+JotziNeN//QmKFumFAmEN7JGIXoQzVZVirJdx9wlMIPgRkA1h/5l9
 vMZr7PO0P6OtSV1KYqa2KJuHFPWJow+lHnP5b3bXHuYmw0df3SQcCTbmsumcS0dop/TUxj
 BRW45OhypH0lcneVCEOHg/lgTC/l8MjA7z3LpMyOmfuXCDzHhPd2EKQzytmOwGBigLqmjl
 6CzVGXp14sKtK2hsGaV1OlalhxdIJmt3A4qKwGd+B0+y+0xtEe5N1k6GvEBNUIuxrA1erM
 HwmoA+cz720pH1Ea8LOuRxXu+1bwBJNk1F1+Ruc8BHSCKsDvRv0JiOQjW59RS92svLH/OI
 I+Cr3r2ktsSVSqU2miZCOjhlNhQlqqmIYyIyu6N7VU0kzfsooMtXrq1HGkCqctU+IDZhKa
 IplfoJSguQcbt3AfXk0wFOo0i8+KAIt+77HOBiMHADiigiAzLsG1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-ed25519; t=1609550617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMHb9QAyYttgipB8eYWrnYvfJ+prGDQGzNUNEYzedX4=;
 b=j7XazsnPb1H4dz+Qnajp+Nt30dwF8LUjVKXVtAEGD6C0esofawmCvj0qxIiTMJpfWe4Rs5
 NqTIBWFBwuFeZvCw==
X-Google-Smtp-Source: ABdhPJxsXvyUq3+ApCCqKEs9bVkCxmCkFcU4X3t5GNoj1uxb+cQKYxF62gNgbHmwou9sRC80DGcH0Q2N2sQ5mBNugo4=
X-Received: by 2002:a25:e047:: with SMTP id x68mr91054769ybg.160.1609550616036; 
 Fri, 01 Jan 2021 17:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20201210174445.3134104-1-kai.vehmanen@linux.intel.com>
 <f9e278f822e97c6698a04ab848beed279fb793dd.camel@archlinux.org>
 <s5hczypay2j.wl-tiwai@suse.de>
In-Reply-To: <s5hczypay2j.wl-tiwai@suse.de>
From: Jan Alexander Steffens <heftig@archlinux.org>
Date: Sat, 2 Jan 2021 02:23:24 +0100
X-Gmail-Original-Message-ID: <CAMQ-g0ddjpKmD9V0UyBTps1cr+0vtzmssxF__EQ0xOEFrxDbFg@mail.gmail.com>
Message-ID: <CAMQ-g0ddjpKmD9V0UyBTps1cr+0vtzmssxF__EQ0xOEFrxDbFg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/hdmi: fix silent stream for first playback
 to DP
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Authentication-Results: mail.archlinux.org;
 auth=pass smtp.auth=heftig smtp.mailfrom=heftig@archlinux.org
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, Jan 1, 2021 at 8:57 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 01 Jan 2021 06:15:42 +0100, Jan Alexander Steffens (heftig) wrote:
> > I'm experiencing deadlocks since 5.10.4, which backported this patch.
>
> Could you check whether correcting the unlock fixes the problem?

Yes, correcting the unlock fixes my problem.

Thanks,
Jan
