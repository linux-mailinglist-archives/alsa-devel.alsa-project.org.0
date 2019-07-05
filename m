Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C880760C13
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 22:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559A416A1;
	Fri,  5 Jul 2019 22:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559A416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562357522;
	bh=GQf0hF6bNxQubcQS18+MT1W+Qsd6MmYNbNYzKkoSN4c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=if1b/eZH2ybDZAJ9Hkyhz4hkeXNA0DHCWksz59k/JE0cWY2SeuWwyqsG/PbbMs715
	 mTFPcVWtAfgFpmmzhN5b3Ed58MQgpCCOToM9gT5K1wAKRqbhSq7HZfH28tN+B91y/V
	 Z8QyisBfK+coHuz6z6E1dLYFYsQsoP2HnDYtwj8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B047DF8011E;
	Fri,  5 Jul 2019 22:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93456F8011F; Fri,  5 Jul 2019 22:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id AD1A7F800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 22:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD1A7F800E1
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23991965AbfGEUKHvIEHf (ORCPT
 <rfc822;alsa-devel@alsa-project.org>); Fri, 5 Jul 2019 22:10:07 +0200
Date: Fri, 5 Jul 2019 22:10:06 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Message-ID: <20190705201006.GA22085@lenoch>
References: <20190704191026.GA20732@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704191026.GA20732@hari-Inspiron-1545>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gen Zhang <blackgod016574@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: add irqflag
 IRQF_ONESHOT flag
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

On Fri, Jul 05, 2019 at 12:40:26AM +0530, Hariprasad Kelam wrote:
> Add IRQF_ONESHOT to ensure "Interrupt is not reenabled after the hardirq
> handler finished".
> 
> fixes below issue reported by coccicheck
> 
> sound/soc/codecs/wcd9335.c:4068:8-33: ERROR: Threaded IRQ with no
> primary handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  sound/soc/codecs/wcd9335.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 85737fe..7ab9bf6f 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -4056,6 +4056,9 @@ static struct wcd9335_irq wcd9335_irqs[] = {
>  static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
>  {
>  	int irq, ret, i;
> +	unsigned long irqflags;
> +
> +	irqflags = IRQF_TRIGGER_RISING | IRQF_ONESHOT;

Why does this change trigger adding a variable?

>  	for (i = 0; i < ARRAY_SIZE(wcd9335_irqs); i++) {
>  		irq = regmap_irq_get_virq(wcd->irq_data, wcd9335_irqs[i].irq);
> @@ -4067,7 +4070,7 @@ static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
>  
>  		ret = devm_request_threaded_irq(wcd->dev, irq, NULL,
>  						wcd9335_irqs[i].handler,
> -						IRQF_TRIGGER_RISING,
> +						irqflags,
>  						wcd9335_irqs[i].name, wcd);
>  		if (ret) {
>  			dev_err(wcd->dev, "Failed to request %s\n",
> -- 
> 2.7.4
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
