Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB14A38F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 16:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD5916D8;
	Tue, 18 Jun 2019 16:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD5916D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560867137;
	bh=JmWzCbvRDz0fLGQ4Zo+M76Xw9T2GehXfJSUzXeFoH+c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6ylqymVh7YSuj1RO4D8Q71aHdPF40hwuttUfLvPiNahMqrGPpCBLH8U4tjH3E5as
	 cy+jVZAkwC2Wr0606KHe4Cw5iSeeedbfGlrHEIXU4oKqHxoP59WC8JL5lBK0BwBd9s
	 AWavbSw2fH8dpUFfJH6Dj397q9FjcRpDaTbJ5REc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C90E0F8971C;
	Tue, 18 Jun 2019 16:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1792AF896F4; Tue, 18 Jun 2019 16:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69E91F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 16:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E91F8075C
Received: by mail-qk1-f193.google.com with SMTP id t8so8642274qkt.1
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 07:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ymzVRv+HbWASk9IbK9IR5jfXe4p30txsWn7MI2aWfko=;
 b=gfgOZiddTTP0jZ2XmbiZsR1SFnNhQ5Rpw0Jp6P58WXuHBUZKef2WJDuoWK9iD2NE1s
 rHV2kDhysCjYK1lfKIKCBdTsVh5lF5tk84K9yUBnBv5CiP+OV/z2ZsWA7UKWpVS5QRaK
 OOIs6hwESbFzYlAvPkoosqla4XXT2wdewz4LaHftVExpjhGf0kF79ZeQibRikj/PzRh/
 tiVHX/c/HqIDO9c7D8VpIbAAkxtUfKog6FKwBlQEineeYfCHGFP+/F2KGicY6/yihN1I
 xrlF9n7IzjxtHApGXmjJeIz1ZFNOH169oBsrS+YX1fvhdF6PSnG5/KZGM2ihOAzUeLl6
 +NWg==
X-Gm-Message-State: APjAAAWAm20SJG0HhkiuK13hsOk/cOpAnn8vLDRzA0biRYETJsHIIyyv
 ddiEM/3cIeFly0ia3wOx2w==
X-Google-Smtp-Source: APXvYqzTd+SUScnI+raBK375orxhwOZtIjBl7LTQ+SrdOuzX+fB6KoQ7w06WVT6SBK2QaP+LwnqcBg==
X-Received: by 2002:a37:9ece:: with SMTP id h197mr75339469qke.50.1560867025673; 
 Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Received: from localhost ([64.188.179.192])
 by smtp.gmail.com with ESMTPSA id s11sm9602685qte.49.2019.06.18.07.10.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Date: Tue, 18 Jun 2019 08:10:23 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20190618141023.GA20154@bogus>
References: <20190617143322.4332-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617143322.4332-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net
Subject: Re: [alsa-devel] [PATCH] dt-bindings: Add missing newline at end of
	file
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

On Mon, 17 Jun 2019 16:33:22 +0200, Geert Uytterhoeven wrote:
> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
>  .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
>  Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
>  Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
