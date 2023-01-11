Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBF665908
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 11:29:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8963F8276;
	Wed, 11 Jan 2023 11:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8963F8276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673432977;
	bh=TdhW/su0bvIqy92U0pt8vjw/OXF7Ir6eSYFDJ/3VUfU=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=r3taVl+E4F2F6YqoZ7cd4tGpN8wXJBPYlCWeQ93yrkbiIaj7ase91paV6qvI+Y/I6
	 /Zv9MmwUh6klKfUhtx7HjWcPw8LMolfLNMQM+w4s5api/FiBYBgzAOcTU9dDpdxsj/
	 cXUI0LbDMpIh55jCaNEdt3knTfqGT0ke2brKlJZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2417BF8030F;
	Wed, 11 Jan 2023 11:28:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D389F80425; Wed, 11 Jan 2023 11:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E83B8F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 11:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E83B8F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=vltt/iDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673432882; bh=mXscmn+EgULEQieYIu4LA309Cv3+2fjfPlbSUiany04=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To;
 b=vltt/iDxIX3I2WCGqQw5rcYDb32e6U0uMg+rd22zmqRO2HS0C9DitMEFmXmvM9DET
 5dF/pAx4K/1SA0F9LTrglAG2ZO2HDS0ohyhxwbrxmfOAHC+o74QVOI0yVRmfer/Wg2
 /FchasJvrlQtBOtMYJw2o1eGrxFmfkdh/0W+g07FrKef1vZ1U1BcPcJ2tsydg+ogYh
 oeXs3o9zgKcTjLP8Gk6raKh/Sl6aKasHtCaN8UYmAalh5qZ/dQnVNemdR0X3o/9cRn
 KjAjYuP6Z6iyus0prrmUpxpJ3tsO69NMNLYI36YRb8ZgQ0Tiu6+pYAqbh3ej10vdBC
 1McSpI4LUq4YA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [127.0.0.1] ([80.187.114.121]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvsq5-1owVHh1CVT-00sffa; Wed, 11
 Jan 2023 11:28:02 +0100
Date: Wed, 11 Jan 2023 11:19:49 +0100
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ALSA=3A_hda/realtek=3A_Enable_mute?=
 =?US-ASCII?Q?/micmute_LEDs_on_HP_Spectre_x360_13-aw0xxx?=
In-Reply-To: <87k01ueqga.wl-tiwai@suse.de>
Message-ID: <028CAB62-8C21-4D3C-9E8B-A380302834ED@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ChjDEo0DHFeTk4WA5JVfwlQqG4a383pf3GtzFbSBWvqHBqPeslE
 8h6N+It7TSbN3BrxnPUeY4a5M7lgaAk2zYEElv74ugY6kgVPrEqa6Wh1jQ088+eSxM3SvOn
 pYy4cjYomHH8Vq1Ii7zZJLPOoNUD0goM48lBiggado7No5LABCiv8AcGEYALWrYWBdUoLix
 88gCcrfHB5Jpvx4yD4c/g==
UI-OutboundReport: notjunk:1;M01:P0:q5Dhu4PM1Lk=;yP3ngGQ1CYldy34myFznmd4EcTA
 taupQcrbxxgANVG3L2DmmMUC5wYC/8QjJFogEOiHxpY2mhuDbXrd12PedS2gtS7GPI9Ng+WrU
 EcV0wtPqdz3ayF0lxEghiccZMO1z8bagtSWpcG9cmBjDn/4X8P4PqycSXaryD2Gzj7AVX2vIB
 R1oeYu7LZSFnqqXxvtVGpfnwjbIvlDRredJ1bi4rLOrarU5gtl/RwLquyz0yX+e2YoF7F6JPc
 KG2dDcziGgWlpo1HGKJsz+bC/UwNJLdB/6k29LAgDC+ZfUMIj1nIIt21f465aCCKPQYglXf28
 IceFNIO1mgFFQje/pPgpCZU6C68/K5CvRcJihWRkOCyH4J7TghNXmwBVM7PuvMK8pPc17CVqK
 L7Hvkm37s46Gr7Qvz8Apn6OMSFSSWiciapTkCmPlHY3Rw/htv3tGqPXNdDfBtONqwDoHorTSJ
 Z39iSYCd+Fca55WAuYS+xykpwJVQf/7awEBYG3PsNyHLjk5zYIUv4VYJWbd3lNkQxmQaYW9E4
 txkjwfSR1KOY6lr7aneFqqyqyu4FZ8v/M51SzrOBMg/3bEW3C8ZvGXoK3525VJ5vWeKUoxmDR
 SNxb6//oXjQIVOt6JVwrWDvsZ8CpXKzylouf0EkIbAeziFMW8CaYaZLIWgieNes/38/3GyEeq
 OHf0/4cDehp2DLMJ8QmshlurISlioxufizUjTzcmkmC+hmjjf4LfmEt6GuqxbOJLnS4YAVDxJ
 jXhVChlFHicjrRrjYeHHZ5g+TJYqSSCg82eXo0C8lRwvIa/EIHMUk0eLmzRlYhQ7tldbTXgiq
 aYSctbpeGA05sW/XBvJRvm0p1gfOwTXD4L4JSr8PLo/ilnBjSuHx4VNPjyEyxvEmFrytzJzyG
 9iCDEaA/j+upkWjiWzUZVEwxtTLZKPwIkTH0ZNdByadiZ9yJowMYkEP7Z/NygSyUsJhZoI8CY
 ab3h8GyX18I/qJmS4oRODiMFYyI=
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
