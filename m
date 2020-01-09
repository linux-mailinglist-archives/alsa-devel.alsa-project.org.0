Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B68136333
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 23:23:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24D78179C;
	Thu,  9 Jan 2020 23:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24D78179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578608605;
	bh=mAXzb03zvqt9Ii3+rhttR91qA856aVprQC50U+f5Tuo=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sY2CP4J47AtFIiMCoxiD2fMB9ZDbIzBJ9aoSeQsP2jnvuFv9VbWkWUxqWHr+Vq19G
	 RHXs312frxIEB+UNjsCfHMfcU9xow/xTEiLWzZ/HeHPpOTmmDgOXux3g6/7PEr6UiM
	 sG1RiCa0A9JO+FG7B1MWXO4tHMRh8X449ieMzvIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C888EF8014E;
	Thu,  9 Jan 2020 23:21:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4187F8015B; Thu,  9 Jan 2020 23:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA0EF80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 23:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA0EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="d3c9vnj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1578608487;
 bh=Th7DnPvuJhY/6sgGLmR9Zqhdkh3xhTX2Sv71iRDzhvk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=d3c9vnj7KpIMBzwB2eRa519+WeYvI8DLeFksCNp+N6MOMVgFEYXLKTSmMT2908b7b
 h+ovhr0dvdSTvzMlIPLGCvt6TfaXLQ5BQwkP2rqzVwqgAnlDI1Mz+O+dtDTdp1Ci+v
 tjrd6yBTxsqJpiO7n6r85eWDSUlBrr10NGMeR/Xg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.202]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6UZl-1inEHH3pcn-006zx4; Thu, 09
 Jan 2020 23:21:27 +0100
Date: Thu, 9 Jan 2020 23:21:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200109232125.6ecd6cf7@gmx.net>
In-Reply-To: <20200109203819.GG3702@sirena.org.uk>
References: <20191227152056.9903-1-ps.report@gmx.net>
 <20200109203819.GG3702@sirena.org.uk>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:DjtTKNqMyIMnbsmFeAWk2Ki8Sa6uq3PTKJ8OS07PD+CGP4ZkvFP
 Gr3Ogz07ggS+WCjJtVLhvY3bAARSkUvOWO7BKaaygw2GfFXf6oYMmWkzpOIUgY64y6B4jvZ
 rGAIVGt7kobbSeBhtxlgRUzAoVyqqni7gQAHqplpqqroUJzbX8G7Ea+jQY5vmdUhz0f3L73
 5Nn900wbNP0Pb/ZDHayyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7TlgbhqVgX0=:6xHe2w0wZonEysTLqGmvsf
 rI/9rFFBZzvHhvod0lYvlBsGZa1tGrYc31LOXxo8o36xy2czZWsDdpkuHO5eF00sXXRyCp5vP
 5ftBQi+K4UtJRlIe66DANLHq9PclZP6+YT/gXC+5eEL0JeSEmDHng27l1Pujj/yzPklUE6a3q
 G0CDmw8SHKJ6+sDqEOQgQAy3EqDDgHt5M/G8IeWWaKAZebWyrDy1Vek7jaAszfGOT95VcwST3
 x7jKYHEebdfTYE/iAJ0x7JbnxcJmBLVgIosO3TdbAVA8Gr6RGVx5Jln0EFaKJG33S9x9hUOgY
 AiVxefCWpyAER/r9IGthxzEP1f9AR8kApgq/3D54+01zua587XJDVPPF2NPKTjcMi5opQOAbi
 2Ad1+5kxxwR1tWDHf0Zu8SWQ2WHIDjIYx4sGU9XJKVnY5T4VGeXTC2E3UqSQhK7Q0RhA9bHdP
 rkqjf3cJrE+kcsZ1rTW2Hbc+pTuLagpE5aYhe7oXPYq+1kjwG5jA97AWXl+ZagQhgUth22aRa
 S/Djy2ySXOzFjZHaxU5hc0bPobZ0iE6nuViuEZdJ4DR5NskaEJ1OpLWQsGR0LwGed1VDjgOO6
 3juSoMo5ahTQuO4BG0dFJCXwmjM+4fnJd705f5JdJ5VBwPAyN9PfGC8vvj6l4I5zG5Z7qDyyP
 FnX4C3CfxsS8KhYO/YUkGMKhkcDMcV+dPgZlQ+Gj61SOqxfm8Jp4VfbC1nC2NjAQpzL9XeTnD
 3s654iBA53kvu174mrj+0tqETCs3gnWBHGhrO8RBZ1+YZ+g0gn5N5BZMmrbdG3ypvSjULxrDu
 CqE5z/LI7XSVtQUXvEeGvKa0ChG22DwTjmf84QLqwlDUjhQLFdRsFTjIF6B2rDRvj2o2ld6pW
 7Xqa112L0aqHEsa9bL83nqzs/XsvOLt5HPme5AUkuicFs2Esdm9XkVV8xBRLUHBK8mBHBmySH
 d978Kq4bfpXsglatC4RcSE11OfnX9sn38Ge7RBI5nvsP8QxTAlWDf9fEanlEVWHrFLpZQ0BEc
 5RPxs/3vHjMwoj7a6OdlmNpJ+DB8p7zUp7i9MkcfO6L9ej4Si0k9Y/FXvQgxQ1FB6aKo3G8Ag
 rXc8C0nmsqgwl881lj65gg6JvpXRbfOgrgzq9WS114w1vDQR/Pd4E5Qm+GXba/1XZFJ5br00d
 Yc75DRkjTQ8wadKGc9FqollVBddk3ddDFgB8P0CufVFV1U5PSOT2Q4MSito8PsMfZJv+jRhsY
 2IQ7Cv5GTuXD+uhAi08FKAxJQ5SnCNoEqG45Eknfq8hKMMbH06cYSm1aRykI=
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: tlv320aic32x4: handle regmap_read
 error gracefully
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

Hello Mark,

On Thu, 9 Jan 2020 20:38:19 +0000, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Dec 27, 2019 at 04:20:56PM +0100, Peter Seiderer wrote:
> > @@ -338,7 +338,8 @@ static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,
>
> >  	unsigned int val;
>
> > -	regmap_read(div->regmap, div->reg, &val);
> > +	if (regmap_read(div->regmap, div->reg, &val))

Unrelated to your question, but I would change this line (on next patch
iteration) to (as all other return value checked places for regmap_read
in the same file):

	if (regmap_read(div->regmap, div->reg, &val) < 0)

> > +		return 0;
>
> Is this the best fix - shouldn't we be returning an error here?  We
> don't know what the value programmed into the device actually is so zero
> might be wrong, and we still have the risk that the value we read from
> the device may be zero if the device is misprogrammed.

clk_aic32x4_div_recalc_rate() is used for clk_ops aic32x4_div_ops.recalc_rate,
did not check/or see on first sight if there is a error handling on the usage
of recalc_rate, but did take a look at some other places where the error
handling seems to be to return zero, e.g. sound/soc/codecs/da7219.c
sound/soc/intel/skylake/skl-ssp-clk.c, etc.

The error occurred with linux-5.3.18, with the earlier versions on regmap_read
failure val was (by chance) near 2^31 and evaluated with (val & AIC32X4_DIV_MASK)
to 96 (or similar)...but with 5.3.18 evaluated to 0 and the line

	return DIV_ROUND_UP(parent_rate, val & AIC32X4_DIV_MASK);

produced the 'Division by zero'...

Regards,
Peter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
