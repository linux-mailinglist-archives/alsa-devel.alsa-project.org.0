Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534D131998
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 21:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C1917F2;
	Mon,  6 Jan 2020 21:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C1917F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578343656;
	bh=7zDtzT5nG3hRNyS3Fgrk7cim6eDEnIhol876qklnImw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4JOBXT6EY5s4HdD6NYBuJLpeZv8SYZ3EpfrUOby96Y/j2nikM37sFMjlFrQSQP2+
	 XmqSG3Ch6devD0dcZZN+VzlKTlsTlFXdjYEvNIUBx/GiS7zBMPO4H6zoGZ5B9EPpdY
	 Z1uG1rtg07FYlBVeM5lFBJ94zyH3k5bF6qiaPNfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6A8F801ED;
	Mon,  6 Jan 2020 21:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 302B9F80159; Mon,  6 Jan 2020 21:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B1B7F8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 21:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1B7F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="Unb+4F7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1578343537;
 bh=AXpGt6vP1miQ02Ok8X67tzEHDpIlBVB845mWvjv5ADY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Unb+4F7Ij6/bVNexShtXbEUPfcoBefbQgOX9fakK6GPKEREeZg/opgspH7CTQZiUu
 VuhJAteg9YWGOOBkzKbKS3NhEZs5VUvAKPKPZ1pMiWABXKAoGFvHiyNJKXCuDc/SNv
 MazE7c4JPEVQlikrT2cbI6lPtX79IutDZbuKZhyI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.53]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1jiJCv3Q21-00uYAY; Mon, 06
 Jan 2020 21:45:36 +0100
Date: Mon, 6 Jan 2020 21:45:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200106214534.39378927@gmx.net>
In-Reply-To: <20191227225204.GQ27497@sirena.org.uk>
References: <20191227152056.9903-1-ps.report@gmx.net>
 <20191227225204.GQ27497@sirena.org.uk>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q8R6Ak8r/kkVJO4HyPxZZFP9/PXIR7PCZyESALXOFPRi68v7X8K
 Y51A8wh/vU6IJRJTrJUaeuolxbvHXNetGMJuD/c3yQBhsH+HX+kZUL63YN0Npzm5vmS+bXb
 7VLbRl1zkMDVnxuG6VpZGKkPSIueDuPcny3VzoL9cB7dS3z6sWmPZKZpGR5DMzQh0xSAD+R
 ZZgKW70iW2e+PrUXeXePg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tc85brVL/yI=:+mntAPO7HQ0u5djZTpfWwA
 hOkc5txGLKc2hvKUyzxbQML2ajspkqepir54aVulJuV2tf10AfrksFoSVDBaTTDgJnxBYG0od
 vyLVM0er68ip8mvExdT7MAG+U2WAS1v/9rmcmokV6lq1Tv4lHdaL4kkswxsdjHPWkrbTrxH28
 pu25K5lIJtTRm99vIIxmNqEYtQcNyUb7ax3wMn3UuqIsx1XLpX01ZbLOvL7tUJb8cNEoZNQR0
 /+JOAs2QvCUWSy4O0gAhIFNBnh97pZe9g5xXt5pKN/pciGrsCJvAN1DFAoX52PejTx0t/1U6x
 Lx7W4CCBZ9vXs2trQta5DnVsayqW0qVl34y386PAWx4BK/7eZw2uSUTr/KAyzvEmLmfrrMb6m
 K5N2Ncb5nI5KXeUtZMmXGjFTPpaamoH6TU97jHY6H5ZHYoVYZ69dScpur88E4bdBPnXA0wo+L
 uB3emQed+ICsCL06T1KV6oDzHgM/OttkkfCecamKC4Yv6VBbUQIdm+FRz847ELXG1F55gITjr
 hX6R8DykdVyljrNHc0LKqsCgOMgX0tjQAF2IEHS61luCv8o2zKpoQ602YzY5aOfW49X+q7Cjc
 o/tnqcljFcnk8BMvGggCHoK95dcQdmvfFgnExSefaI6Ie8Do1A5yZ1VFt/6fcUgaHHCcBxjmV
 +R+khm6TuiHh6F3yi2keKWMY6KE9Ys6R8I3jLp9OrXzL7m12iIL2UATz9AMFZEn1StYtK1w58
 vxF75a5watVTxfeCN8c3RSmnSJT8tp4bIQ/vUi4s7xgJ062HY5W8HKxigWcAifixd+eAiPy98
 P60AsyMc6/e+xDj8Akt1/Gr/aetUn8bwHWJX9c3etGb+njApHMD8AQlC1kNxrcx1iCQjGTY8y
 O1r/xPxxPNitcVdfxfZrT29szswy/RyQPBhv450al7fZDiLey09BPKYZDvuCE8+GNvgX9eIvy
 7YhR6O3+gO6bliqQ1y3SmfX5BYB64Wi40Zy7uqAcKE5oBzjD+RUnVbMkUt8rFqv81jNifCyfo
 OpkZ6KYNjbJUglHIwNHgGKqjTzeZfc4fzR2JbniMhm4L/wnKAw9J8SKF0VgCO4fkGGTdYWdGI
 JAfkjHQobHN2JNn0+oefdkRbHtpPxagBUPBbXY/izlHcpOYK187R1SUlP2JfOoLhVLt7NJsQI
 tI6C0mTMCXqHCQg+XPqEv3zqDytphlFz9CRWMF1gbuxPYIoD2ieq9A+QQrF200GzAJPUvasvm
 2P0S8btgCscQPCzJv2d7+HwslzT4NZLwTGm5KSX8OpT+rmhpCQyg7O/7iHpM=
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

On Fri, 27 Dec 2019 22:52:04 +0000, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Dec 27, 2019 at 04:20:56PM +0100, Peter Seiderer wrote:
> > Fixes:
> >
> > [    5.169310] Division by zero in kernel.
> > [    5.200998] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.3.18-20191021-1+ #14
> > [    5.203049] cdc_acm 2-1.6:1.0: ttyACM0: USB ACM device
> > [    5.208198] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> > [    5.220084] Backtrace:
> > [    5.222628] [<8010f60c>] (dump_backtrace) from [<8010f9a8>] (show_stack+0x20/0x24)
>
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative then it's
> usually better to pull out the relevant sections.

Thanks for review..., but a little disagree here, do not know much which
is more informative than a complete back trace for a division by zero (and
which is the complete information/starting point for investigating the
reason therefore) and it would be a pity to loose this valuable information?

Maybe I should have added more information about why and how the failing
regmap_read() call leads to a division by zero?

Any hint for a better commit message is welcome ;-)

Regards,
Peter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
