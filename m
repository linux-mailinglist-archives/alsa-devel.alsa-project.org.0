Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA736A900
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 21:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5DA61687;
	Sun, 25 Apr 2021 21:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5DA61687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619378718;
	bh=tFauaV9cViTp1qZPHoSSipJ9OKEO/i9fVxaJnLz/edA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIDcuvt/AQdKLns9pAPlRnoXNJ4QJ9wupF6aNRkqZNbsknod30AYvcrl0TpmR5/Ss
	 ydbUNfuPgX1gJaBNqZYkCZRW7t9zpifW9H6RQOJu9jCTXf4cjKJCD3M744u4TjokJR
	 dHqZYKKcrnFHA3jKYt/50PRnVYgfQ9vhUNS5zKwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FB9F801ED;
	Sun, 25 Apr 2021 21:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C74F801EC; Sun, 25 Apr 2021 21:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06E78F80117
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 21:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E78F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iumi5GCm"
Received: by mail-ej1-x62a.google.com with SMTP id r20so31462523ejo.11
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bNlC2PYt+8rP0ftgrTExxnqZuxGBMArnSwpqoX2fM1Y=;
 b=iumi5GCm9yguxL0ynQX6a9/xsu/ZAz8z3zv94Ijd/PrrccbK5Nu6g5GK+3BNc2gFuw
 hxmMaIPSSDfmnDlPoJGcY16Gn+UBD+2jLwdHA1pCTWgnq3Jf9UVbjD4wMnbQq9aKx9md
 EoSZAwVkq7Z6y3d9k5oQ1qaRqS/WtjlnUtQlPf13uO8VQRLp85WOZTayQH/c1b4dyakE
 RzzNM56lf6CZIKV2WiZ7Q9jF1od1jwaGo7DvVuoasNFnTNS0WFWrJuu/x908aj5zFSD2
 G45h4XTWR5CVgPxNfuJX9TPnZwH1MCu+KxMSRqlsijqx8tjpYLf3NV/XfT4bbl48LeOq
 68Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bNlC2PYt+8rP0ftgrTExxnqZuxGBMArnSwpqoX2fM1Y=;
 b=GGZyHxrwrrzlvw8VpYMvCuXVsyVtbOAh5MVZPuoZExKOHVhwc3tVjuhpVanNuY0V+g
 buA6VIXfvMABKAvI8OutcFsQL+XVGK7Re8/danl4+PnKI+pEtHdzjlO5zgwoYctAVq+0
 k1/qRCF/7n7sgiG8032scKektdY2bJyXFT5foxWptGt/L/NuyDa++XGiAIdCQ1H8ad70
 rJV1XF5Y/yfrm5+Cn1DzuyKSFG7ria0knotzNRPGJiYNp0FtVBxnJpyhBqUDySDzuu3Q
 yeEpkeXmfVNX5oNvXj4j8nWPNTWwtBYcug1EF5wB7OvIf346niERrrBnSjInCAnVUuHH
 Bm8Q==
X-Gm-Message-State: AOAM531XOkIVtf8w7ZN+BZqz9G8JMT4XsbyuU/G1h31P29QRorLznOdl
 rH+SG7L1QEL2SfcSi+m81Z/txeIHGGkxVbX+5GVN/4BJrjw=
X-Google-Smtp-Source: ABdhPJwoiwG0in1UPuNA3eNPEi/APqNGgqmyc35S/mPIX5UMXS3lO42k/SyXF+PoLlJUzuMbpBlYD9/Hr+57e9bM7+c=
X-Received: by 2002:a17:906:94d2:: with SMTP id
 d18mr15015496ejy.531.1619378623275; 
 Sun, 25 Apr 2021 12:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <CAOsVg8rAkwLgLP_LSj6CfYG+1R2oB5-sV4KQhLJMqCEqL2wDQA@mail.gmail.com>
 <s5hlf99788o.wl-tiwai@suse.de>
 <CAOsVg8rPfh-scSmmJSVASPTw7o3vw_zZ05YzVZ_JYFJHbcOcyg@mail.gmail.com>
 <s5hlf964td3.wl-tiwai@suse.de>
In-Reply-To: <s5hlf964td3.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Sun, 25 Apr 2021 14:23:31 -0500
Message-ID: <CAOsVg8okhRKPSnSOOCjMMD4wBxFB=E1i7JaQQY0T+CfCa_Jz1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A . Milner" <maillist@superlative.org>,
 Mike Oliphant <oliphant@nostatic.org>
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

That patch worked perfectly for both devices I noticed the issue on (the
Roland INTEGRA-7 and R-26).

Although unrelated, I think the other issue with the EIDROL UA-101 in full
speed mode (USB 1.1) is new since trying the 5.12.0-rc8-next-20210422
kernel branch.  Prior to that, I'd been continually patching updates to the
mainline 5.11.9 source.

Thanks again, Takashi!,

  Lucas
