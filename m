Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97662E8261
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 23:47:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657CB1708;
	Thu, 31 Dec 2020 23:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657CB1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609454830;
	bh=vWRf9+QtcBOdiln5j7M9lXDj8RSqne9gog1SWTOVAbY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYOf+LGbIpHMhY4PD9txHGLxAywwnxqI+fNTQG87HaWqU9YIfU10FBBsbZA7QN9aS
	 OS0yLa7erWJ5wrdwCZ01LzaZcBSOrT2F6SPUNkKOaXot7NOr/+2k+LiNsr4xKhWKus
	 Rq2pOwBPIqPOwQWdshPo2Krsf1d/pYd6xXMfTHsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA712F8022D;
	Thu, 31 Dec 2020 23:45:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3310FF8022B; Thu, 31 Dec 2020 23:45:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5065F80141
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 23:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5065F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net
 header.b="fvvOqr2D"
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 63D3260B;
 Thu, 31 Dec 2020 22:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63D3260B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1609454721; bh=tMnJuIUNfFdc8FRuTCustjnoFzYrW86BK7QzKx5Y8uY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fvvOqr2D52pcHO5U+rmC245H1ANjhQVhPQ8anZ3sJBAePTEwjDa+W/9hNIhZfzKuo
 U0wmvhx02lT7Ujt1wzEOoOrgdXa8ooqrtpPF6OPicXT8h/FtmaASaUnD7TXHGTZEEi
 7wyClBrH+KduCpG0eOzDy1xKoYn0PPVIlOoYroJA4RoqVZPX/mXlj+nJFhfokljBQI
 4vYUBoPX4TMEmA1JFA7ldTGGmg6l4oN4a/0OKDTkYDgWBEEqoh/hk9hzIedT2uFTiA
 0vb/iWkG1OPBhRRPNnSeUmIe7NjRu2w37HUpnSPW2miy2dFq27pl+/V7E6cx8vaZQ+
 1UM8LIztNX5Xw==
Date: Thu, 31 Dec 2020 15:45:19 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Subject: Re: [PATCH v2] docs: Fix reST markup when linking to sections
Message-ID: <20201231154519.25425c3b@lwn.net>
In-Reply-To: <20201228144537.135353-1-nfraprado@protonmail.com>
References: <20201228144537.135353-1-nfraprado@protonmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, andrealmeid@collabora.com,
 Joel Fernandes <joel@joelfernandes.org>, Stephen Boyd <swboyd@chromium.org>
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

On Mon, 28 Dec 2020 14:46:07 +0000
Nícolas F. R. A. Prado <nfraprado@protonmail.com> wrote:

> During the process of converting the documentation to reST, some links
> were converted using the following wrong syntax (and sometimes using %20
> instead of spaces):
> 
>    `Display text <#section-name-in-html>`__
> 
> This syntax isn't valid according to the docutils' spec [1], but more
> importantly, it is specific to HTML, since it uses '#' to link to an
> HTML anchor.
> 
> The right syntax would instead use a docutils hyperlink reference as the
> embedded URI to point to the section [2], that is:
> 
>    `Display text <Section Name_>`__
> 
> This syntax works in both HTML and PDF.
> 
> The LaTeX toolchain doesn't mind the HTML anchor syntax when generating
> the pdf documentation (make pdfdocs), that is, the build succeeds but
> the links don't work, but that syntax causes errors when trying to build
> using the not-yet-merged rst2pdf:
> 
>    ValueError: format not resolved, probably missing URL scheme or undefined destination target for 'Forcing%20Quiescent%20States'
> 
> So, use the correct syntax in order to have it work in all different
> output formats.

Applied, thanks.

jon
