Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49668A205
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 19:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E2F82B;
	Fri,  3 Feb 2023 19:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E2F82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675448894;
	bh=/gGZ9DwGLZg6jeLZ/Wca9dGvDkPShPONk1yE/DS5X2U=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xdn5loE6V00a38hvMnlvZzwJUasjD1E1hbSackuBCvgXD5P13mEpcw/WLYb+lbGrJ
	 bC9x1+my11ZKBVPoG/CF5zxrD2J/S1t5XYnHW/Ak+Bp076XJOcM1SylfPelW5eIgdS
	 ZOoYJ4KtVwXF9DuXieRxPctvN0iCauAt1HJnhGxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C70F802E8;
	Fri,  3 Feb 2023 19:27:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEAE6F80254; Fri,  3 Feb 2023 19:27:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC50F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 19:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC50F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ibou1Av0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4B5D61F51;
 Fri,  3 Feb 2023 18:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962ACC433D2;
 Fri,  3 Feb 2023 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675448826;
 bh=/gGZ9DwGLZg6jeLZ/Wca9dGvDkPShPONk1yE/DS5X2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ibou1Av0ziWyc38GTlFFW39X3zPS+WgBGY9WIaLThXolJ3efOkr1EZJyJrLrfw1xT
 tPsjJ/HXBfiaQcE1GBWhcrL8Rl1gsTqdryBHtoKSWn4o/Ol4cTUff2ZSDvxDx37Q4z
 ZvpU1Bp1cXCImIzgi1toeJwkkesVNjWXqL4x9qHsDlAQFwI05qkVMLiTIpLW2zXEzN
 8tLSKve7+4BAMp3k+ovNYkyjt/5/ZBXsIcV6zS+u2yYXoCvmhVeR2+vYS4nL2Yc5Fv
 rkrNOFcSc1NWGPXwfQLQ2FDwTw/eESW8T4AM5WzPYH3ePz61OZdqYDnz8DqCcHB6vS
 9JJBRxDMSQS+w==
Date: Fri, 3 Feb 2023 10:27:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Message-ID: <20230203102704.66f6b59a@kernel.org>
In-Reply-To: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org, mpe@ellerman.id.au,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 christophe.leroy@csgroup.eu, linux-ide@vger.kernel.org, npiggin@gmail.com,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed,  1 Feb 2023 22:36:19 +0800 Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>
