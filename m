Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9BA70147
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A34E17EA;
	Mon, 22 Jul 2019 15:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A34E17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563802923;
	bh=pL1olDKfZHAQaDacI45VnW2wWpNX4+heHj+aj9ipmnM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0QrLXXRlzkNGwNuPNTjsSGc65dm4Ky+3i3RFPMF5V04eVTZpUYotFbxC0gXHV5ei
	 JQvqrknccZQt9Q34b8Wo0fQLrE+WcuZV1znlrMIaPiRosUNRnJ3FrUSCRjhdDDQ56W
	 1kxRsEefaZHNsSybcA/mnf3cgmFkso0+O6PCashw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B83F803D7;
	Mon, 22 Jul 2019 15:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26F76F8015B; Mon, 22 Jul 2019 15:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B5EF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B5EF8015B
Received: by mail-qt1-f193.google.com with SMTP id h18so38507665qtm.9
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qv3Di5zFjee/5uIy87kvMrew8FbfGsaqzmofrRO1ci8=;
 b=JnX6AVrbqz5thlo6tmCWSMsAsiyUYzjZHOni+uSldhcaJyLza5ID/OsEfItYyt0AbX
 r/mY9Wl6pT2dG0xHQWXQem+O06aSpg43ml2/55VyYS8ZVqbDuJ3pMZMinOZuuCIybfAe
 ONCF0BM4wmqmsZz4Cg29VE9cdm6ovONAexX+FqOUk6wZ0scI4+Cp1jHoK3msih50EUOc
 0aeCdd5I6F0TqnkgtUVG265rWCWOAFK/VFFxv40ejrpghTxRuwsY3s7h8/R+hR6f2uF7
 XXcAPJ7f4yuAJXKLp/399yFAs+yPBxVrnTn/WShayJJ1gTk6moAlHukE41LtbkLv8jge
 rFzA==
X-Gm-Message-State: APjAAAWYoHe5Wn3GSmdXN4IdusmCOL577h6mgr/LeH6wzvXTgEcwTxPX
 2YGuMSfwbqB76C3neqAaChED+1/Bb+NjXB5U+xg=
X-Google-Smtp-Source: APXvYqyTuLcNdosoh+LeAl/GQzQpUZHJkEpjoi8KGP5gY16F6IIHBf+uq9kFjJjVY+hCkSQkeUo0n/D6sYOhRmZsPIs=
X-Received: by 2002:a0c:b758:: with SMTP id q24mr50452880qve.45.1563802811962; 
 Mon, 22 Jul 2019 06:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190721142308.30306-1-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Jul 2019 15:39:55 +0200
Message-ID: <CAK8P3a01MzCTJnk_fuMgWsRBa3u_CEZegZqH37G7qLiquHWncA@mail.gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
	in uapi headers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Jul 21, 2019 at 4:25 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>  struct snd_sof_blk_hdr {
>         enum snd_sof_fw_blk_type type;
> -       uint32_t size;          /* bytes minus this header */
> -       uint32_t offset;        /* offset from base */
> +       __u32 size;             /* bytes minus this header */
> +       __u32 offset;           /* offset from base */
>  } __packed;
>

On a related note: Using an 'enum' in an ABI structure is not portable
across architectures. This is probably fine in a UAPI as long as user
and kernel space agree on the size of an enum, but if the same
structure is used to talk to the firmware, it won't work on architectures
that have a different size for the first field.

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
