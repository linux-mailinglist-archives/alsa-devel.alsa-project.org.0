Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF4665907
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 11:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A595821B;
	Wed, 11 Jan 2023 11:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A595821B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673432949;
	bh=TdhW/su0bvIqy92U0pt8vjw/OXF7Ir6eSYFDJ/3VUfU=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=eLdigX5QBBwi2BNl+27lXZ8FyNVfxTg9TdkpVMQWCyUyem37VzehDA/rY3uswthrE
	 e1FPDDKrRkbi3GQrus+0TFeHZUGfljf6FSANyOGKa7k5FOPfm9duYgmIPEbffcoi+P
	 xe48BtFP0/SOTYtGZFf4rUGReP2Ldgdc4ZREHvas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CE2F80424;
	Wed, 11 Jan 2023 11:28:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D5A5F80424; Wed, 11 Jan 2023 11:28:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B83F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 11:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B83F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=HnY7/QUQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673432880; bh=FN/H6q+AUS8GfOmhvewAJdPFGaXlQvuOzOvjllUz5/Q=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To;
 b=HnY7/QUQbE8XGRaB1cbS+NI4jITySxHrbGGsFOOEynQtRnQ+IjTf2nD53CgglKS+U
 cSwwFaLJOBO4tYo6U7zV3p4J5VqfhUgTabLV+TPQqbks4iMDirAOGp4WFUjuXf9+DI
 zuuA9Njf8LVgF/J2aM/eP6Ievj7u+u8Rx+KSNZCkTRGi0GdoohO9jwMQlpyZqnBWcA
 PsCXXN5TAMoNCHrt+mmXtpBR/GLsWTM9F5H25PyhzUW+B28yYPQoutNVCXWTapBKmL
 Mos55sOsDqOgH00LLHacEkERy6nKWWxmQJGF+tdpudR6NJIdn9X2R30B3xQhNCLcJU
 yUVEjVjt+5Yxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [127.0.0.1] ([80.187.114.121]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJFhJ-1pUjZj2CoF-00KRUV; Wed, 11
 Jan 2023 11:28:00 +0100
Date: Wed, 11 Jan 2023 11:27:59 +0100
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ALSA=3A_hda/realtek=3A_Enable_mute?=
 =?US-ASCII?Q?/micmute_LEDs_on_HP_Spectre_x360_13-aw0xxx?=
In-Reply-To: <87k01ueqga.wl-tiwai@suse.de>
Message-ID: <FCFCA221-383E-491A-8DF7-66BA83A086FB@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bZzYsg/qT8Ujd/CZHC+ojL0BhHMUeAdAiElaZezPxfkQgz3ycyb
 TnahPJs/PGm/XVviVKjEpUGdiIlevU0VDxqBVbJlHCQSBydGB4RMXBDhHtfTWGG4BDcFO0D
 GW4ipXc+lVvs/H6STLeyph745tJhUgl0jXBGTDwnaBZFa7e12TmQEIbSPMYqQTbxuVxe0df
 9xThPzbel6VlLJM9psEjQ==
UI-OutboundReport: notjunk:1;M01:P0:Te96pD9XVlY=;ghP6ewk+L+8U7gpwDRoW0zwyKRz
 9M/bAROmtsoHb2Xr2Qy4X7zqSp0fyJXmBfXNND2MPcOIxqjTsqPMEadBMDkGvEBXl7MI24/T2
 tLqcfx4ikBQqnTrHQsPQJkoaoDyASuZ1K9A5UQfC8V2cU69TaDUn2XhvA//OgNBmW1hG6LyOq
 FntSqO6xInjs5EGIeRLP5ez5Sp14kb1dWWJIV17Pc7VIrQIUaqDFlTZDpyYTXn74AdJLvEzwV
 RUb6SBYmiCJ7GLkFt7TIDldp7/wGsJIy86dtPj3MBnC6wcOescqWW3h1yn6MLy2xozWCVBW0+
 YrsVmNeslxCS/ZdKdgd2nRV/2wSvhjAR89LGhIfrFx/VhzxwyZesRR3IZy8TFf1saA61TWQSf
 0xdIB0Cnnm8XE9uU+C3AII2gB55Fjv3IbpWD2+QTlGr5ZHF/WMqI2pblctgQ1bHu3l6lsjzLG
 AnCPLWNjDwv1AC3+dTXs2lzXQrYs8t4HxzY9skw7O6lBFIBSxGCrmJriHa+arJIR5oBQbe0iI
 8h2KTzTOQQLKhyTv2lrwUEzTzaiwpZ/8Cv6D9uZCWNtvAtnXYe3XYADYaXUl+jvSOYVE7yJnL
 c/pDJe7PWVd8tqk8/q0U6FRinJPukTyCB3Slvi6UYuPZ+pTgPH0Ig5uS5YYJRAtGxp1tH0aog
 Jd/TLSLhD7u2u5uG24AxAfcSvnwAse00wq6KWLQuO5s5Pn7n86GENohbcZTmR+VWL3FuDfP0n
 hLVSt9GUVO+M9w4HzWhIoSm096UnuSN5Hn/IkkxDpJml+lTU9aSjll5hNHWMg+O/fIbyJfDhL
 jtQ7xKglRndsyK5mpD8uGhDtzwFOgbJOff4CKLeXrEq3hvvKhq/KSldXvFNBuI+hzC6X+GsOs
 1CwNxOuDbCOYwaHKBZvEJSLiCVObfG8uWJWkyhgA0ay3DrYvSz3pWItFO7y6kCjzYXX3cIdV9
 YLCY4eeO5ueGgrzHx18b79ZtXAo=
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: l.guzenko@web.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This seems to be a mistake on my part=2E
I have inverted the condition and recompiled the Kernel on my system=2E
It works=2E I have created a Version 2 of this Patch=2E
Thank you,
Luka
