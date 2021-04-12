Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EF35D1F6
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 22:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F77F886;
	Mon, 12 Apr 2021 22:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F77F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618259250;
	bh=r9UKdIFOgp7BUaHYAHhj7B4vhiYePgsCQ4+XN5Emsd4=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2tGUo7mHa6/mvHne2I0Uxq7OvwEzVTz2GXgJODtLpJ/pAy//WjFm2X98kd+majQ8
	 RdAxaFtQU3Ft8Jx3VaHfcSPWMd5E4XYFZHLHv+O8nVeGBDiqpkWiubj887rJldS/Di
	 0M3vebGLVfxg5uEBr0CsLyW0Bz8aYqXjq2HzxfKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93408F80271;
	Mon, 12 Apr 2021 22:26:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DE23F80269; Mon, 12 Apr 2021 22:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026A1F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 22:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026A1F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AYOwAoNu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E5FC61352;
 Mon, 12 Apr 2021 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618259147;
 bh=r9UKdIFOgp7BUaHYAHhj7B4vhiYePgsCQ4+XN5Emsd4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=AYOwAoNutSyEqKl/2oZRcdM3qcas7yBRs2LDYEwXIM1B/XVxzEl710EIpG4BJL07Q
 1ifr2J6YaQnGYpAXvTakowZHoxrqrGofbVULEDDEA1Zw3JpwTS69a33HxXjrC4JU4x
 jCiFPin/JuJjKnVCLBfaWMI9kcdGVshDDFvc4Q6MDPQNQYjmPskTjauto+klyqj87V
 9HLCjUvaW3V7CXhRXaggpGYwOzrAFsQcTffpcGt/0jfr9QqgtVb8wR8rZtwg9hvEY9
 rC9mU/TBKWlojN3qhx9uYtXE7U6hJA7xWpXHUW00J5qg2cu04dOI6149IJM/gdkCMM
 Adz/rWlUZEWzA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410111356.467340-2-jbrunet@baylibre.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
 <20210410111356.467340-2-jbrunet@baylibre.com>
Subject: Re: [PATCH 1/5] ASoC: stm32: properly get clk from the provider
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Date: Mon, 12 Apr 2021 13:25:45 -0700
Message-ID: <161825914594.3764895.14268186433795123078@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

Quoting Jerome Brunet (2021-04-10 04:13:52)
> Instead of using the clk embedded in the clk_hw (which is meant to go
> away), a clock provider which need to interact with its own clock should
> request clk reference through the clock provider API.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
