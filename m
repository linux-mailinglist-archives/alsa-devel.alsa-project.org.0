Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE68201D3D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 23:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B4B1683;
	Fri, 19 Jun 2020 23:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B4B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592603050;
	bh=rbHAafTHxA2RZw0SSH2VJruFzPeGR2VGxtY4NS6HjVI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T58RFFAJTWj7GQtRRlnW10gJJh4XNdw+0mE6XgiU7KIIJQ/ksn+Uktv5uSJt4XfhM
	 5Xme2X6gHQtOVj1gyJAs2Xu7+m29hIo5WHuQtOc/KigQcstrOax02HKqdgeIhEMUaY
	 BsP7gPzSpD2ijMJSimVUWxVFbDOKyfgb2UjcpV/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BF0F8028A;
	Fri, 19 Jun 2020 23:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77624F8028A; Fri, 19 Jun 2020 23:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34997F80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 23:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34997F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Z1RK9K9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592602896;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rHK0cXpZw8Y668uCrG8vhx3naoSmZjRUO3mOxBZPeJs=;
 b=Z1RK9K9PVVSUoOC/ZtfMHlFRataAmk10MGFeB5d+4eqCdrd75ePXGlso0vkGyibzke
 l4U3eCc5TrM9UfGrpge9Ro9hhXP9l2GHvysl0FQ+k7I4AL6GrAAhupQ9/GGe9MpEyVix
 7SvACRvjw/CVJ1c2A9SOqmD666XVXH/naE0Z3g39Vb1GODZ92/5Yc193xMdzn2TyP1q6
 e2L6/YTjbxn8V7BwjpiB6OfMLkhH//exi2TN0FhUAHXy+1rgpJZyTOGMvIzVc9Z7u+vG
 sw4wPtPszq2ixqoc5Y5ABYN+XYocuiAn+LHtvXJVW1I4XJLSNMcLiXvckj9IXSgZ+5nd
 OCOQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczFaoo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 6005e9w5JLfUr2y
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 19 Jun 2020 23:41:30 +0200 (CEST)
Date: Fri, 19 Jun 2020 23:41:26 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Pantelis Antoniou <pantelis.antoniou@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200619214126.GA1251@gerhold.net>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619193831.12528-2-pantelis.antoniou@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matt Porter <mporter@konsulko.com>, Shawn Guo <shawn.guo@linaro.org>
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

Hi Pantelis,

On Fri, Jun 19, 2020 at 10:38:30PM +0300, Pantelis Antoniou wrote:
> Add a yaml device binding for the QCOM apq8039 sound complex driver.
> 

Nice to see some activity to get sound working on another SoC!
Thanks for documenting all these properties.

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@linaro.org>
> ---
>  .../bindings/sound/qcom,apq8039.yaml          | 370 ++++++++++++++++++
>  1 file changed, 370 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
> new file mode 100644
> index 000000000000..f1c4fb99ccbb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
> @@ -0,0 +1,370 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,apq8039.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies APQ8039 ASoC sound card
> +
> +maintainers:
> +  - Pantelis Antoniou <pantelis.antoniou@linaro.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,apq8039-sndcard
> +
> +  pinctrl-0:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Should specify pin control groups used for this controller matching
> +      the first entry in pinctrl-names.
> +
> +  pinctrl-1:
> +    description: |
> +      Should specify pin control groups used for this controller matching
> +      the second entry in pinctrl-names.
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +    description:
> +      Names for the pin configuration(s); may be "default" or "sleep",
> +      where the "sleep" configuration may describe the state
> +      the pins should be in during system suspend.
> +
> +  reg:
> +    description: Must contain an address for each entry in "reg-names".
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: mic-iomux
> +      - const: spkr-iomux
> +
> +  qcom,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of the sound complex.
> +
> +  qcom,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      List of the connections between audio components;  each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source; valid names could be power supplies
> +      and MicBias of msm8916-analoc-wcd codec.
> +
> +  function-definition:
> +    type: object
> +    description: |
> +      Functional configuration for the sound complex via a
> +      simple control. allows fixed and dynamically constructed
> +      function selection.
> +
> +    properties:
> +      mixer-control:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: |
> +          Name of the exported alsa mix control.
> +
> +      function-list:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: |
> +          phandle(s) of the functions which the sound complex
> +          exposes via the control.
> +
> +      system-list:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: |
> +          phandle(s) of the default, init and shutdown functions
> +          Must be one of the declared ones in the function property.
> +          The default function is the one selected by default on
> +          startup (after the init function's sequence is executed).
> +          On shutdown the shutdown function sequence will be executed.
> +          Typically init and shutdown are the same and it's purpose
> +          is to initialize the sound complex mixer controls to the
> +          all off state, and be ready for a regular function selection.
> +
> +    patternProperties:
> +      "^[A-Za-z_][A-Aa-z0-9_]*$":
> +        type: object
> +        description:
> +          Function description subnodes. The name of the function
> +          is simply the name of the subnode, so restrictions apply
> +          to the valid node names.
> +
> +          The function definition of each subnode is either a cooked
> +          function (i.e. which is not dependent on state inputs), or
> +          a function that is selecting a cooked function based on the
> +          state inputs and the generated state vector.
> +
> +        oneOf:
> +          # non-cooked function
> +          - properties:
> +              enable:
> +                $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +                description: |
> +                  Sequence of alsa mixer controls to apply when this state is to
> +                  be enabled.
> +
> +              disable:
> +                $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +                description: |
> +                  Sequence of alsa mixer controls to apply when this state is to
> +                  be disabled.
> +
> +            required:
> +              - enable
> +
> +          # cooked function
> +          - properties:
> +              state-inputs:
> +                description: |
> +                  A list of state inputs to be used in constructing a state
> +                  vector.
> +                type: array
> +                uniqueItems: true
> +                minItems: 1
> +                items:
> +                  anyOf:
> +                    - const: JACK_HEADPHONE
> +                    - const: JACK_MICROPHONE
> +
> +              state-input-bits:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                description: |
> +                  Number of bits to use for each state-input in the
> +                  state vector creation. For now only the value 1 is
> +                  supported for JACK_HEADPHONE and JACK_MICROPHONE.
> +
> +              state-input-defaults:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                description: |
> +                  The default value to use as a state input at startup.
> +
> +              state-map:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array
> +                description: |
> +                  The mapping of this function to a cooked function. The
> +                  format used is a sequence of phandle to a state, the mask
> +                  to apply to the state vector, and the equality value.
> +
> +                  Take the example's configuration
> +
> +                    state-inputs         = "JACK_HEADPHONE", "JACK_MICROPHONE";
> +                    state-input-bits     = <1>, <1>;
> +                    state-input-defaults = <0>, <0>;
> +
> +                    state-map = <&speaker    0x1 0x0>,
> +                                <&headphones 0x3 0x1>,
> +                                <&headset    0x3 0x3>;
> +
> +                  is decoded as follows.
> +
> +                  There are 3 possible cooked functions to be selected.
> +                  speaker, headphone and headset. The state-inputs are
> +                  the JACK_HEADPHONE and JACK_MICROPHONE, which are single
> +                  bit values, being placed at bit 0 and bit 1 of the
> +                  constructed vector.
> +
> +                  The 4 possible state vectors are:
> +                    MICROPHONE=0, HEADPHONE=0, 0
> +                    MICROPHONE=0, HEADPHONE=1, 1
> +                    MICROPHONE=1, HEADPHONE=0, 2
> +                    MICROPHONE=1, HEADPHONE=1, 3
> +
> +                  The speaker function is selected when HEADPHONE=0 because
> +                  both (0 & 1) == (2 & 1) == 0.
> +
> +                  The headphones function is selected when HEADPHONE=1 and
> +                  MICROPHONE=0 because (1 & 3) == 1.
> +
> +                  The headset function is selected when both HEADPHONE=1 and
> +                  MICROPHONE=1 because (3 & 3) == 3.
> +
> +            required:
> +              - state-inputs
> +              - state-input-bits
> +              - state-input-defaults
> +              - state-map
> +
> +patternProperties:
> +  "^.*dai-link-[0-9]+$":
> +    type: object
> +    description: |-
> +      cpu and codec child nodes:
> +        Container for cpu and codec dai sub-nodes.
> +        One cpu and one codec sub-node must exist.
> +
> +    properties:
> +      link-name:
> +        description: The link name
> +
> +      cpu:
> +        type: object
> +        properties:
> +
> +          sound-dai:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            description: phandle(s) of the CPU DAI(s)
> +
> +        required:
> +          - sound-dai
> +
> +      codec:
> +        type: object
> +        properties:
> +
> +          sound-dai:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            description: phandle(s) of the codec DAI(s)
> +
> +        required:
> +          - sound-dai
> +
> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - qcom,model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/apq8016-lpass.h>
> +
> +    sound: sound@7702000  {
> +        compatible = "qcom,apq8039-sndcard";
> +        reg = <0x07702000 0x4>, <0x07702004 0x4>;
> +        reg-names = "mic-iomux", "spkr-iomux";
> +
> +        status = "okay";
> +        pinctrl-0 = <&cdc_pdm_lines_act>;
> +        pinctrl-1 = <&cdc_pdm_lines_sus>;
> +        pinctrl-names = "default", "sleep";
> +        qcom,model = "APQ8039";
> +        qcom,audio-routing = "AMIC2", "MIC BIAS Internal2";
> +
> +        internal-codec-playback-dai-link-0 {
> +            link-name = "WCD";
> +            cpu {
> +                sound-dai = <&lpass MI2S_PRIMARY>;
> +            };
> +            codec {
> +                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
> +            };
> +        };
> +
> +        internal-codec-capture-dai-link-0 {
> +            link-name = "WCD-Capture";
> +            cpu {
> +                sound-dai = <&lpass MI2S_TERTIARY>;
> +            };
> +            codec {
> +                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
> +            };
> +        };
> +
> +        function-definition {
> +
> +            mixer-control = "Jack Function";
> +            function-list = <&auto &headphones &headset &speaker &off>;
> +            system-list = <&auto &off &off>;  // default, init, shutdown
> +
> +            auto: Automatic {
> +                // Headphone presence bit 0 (1) - H
> +                // Microphone presence bit 1 (2) - M
> +                state-inputs         = "JACK_HEADPHONE", "JACK_MICROPHONE";
> +                state-input-bits     = <1>, <1>;
> +                state-input-defaults = <0>, <0>;
> +
> +                // HM & MASK
> +                state-map =
> +                    <&speaker    0x1 0x0>,  // no headphone -> speaker
> +                    <&headphones 0x3 0x1>,  // headphone but no mic -> headphones
> +                    <&headset    0x3 0x3>;  // headphone & mic -> headset
> +            };
> +            headphones: Headphones {
> +                enable =
> +                    "RX1 MIX1 INP1", "RX1",
> +                    "RX2 MIX1 INP1", "RX2",
> +                    "RDAC2 MUX", "RX2",
> +                    "RX1 Digital Volume", "128",
> +                    "RX2 Digital Volume", "128",
> +                    "HPHL", "Switch",
> +                    "HPHR", "Switch";
> +
> +                disable =
> +                    "RX1 Digital Volume", "0",
> +                    "RX2 Digital Volume", "0",
> +                    "HPHL", "ZERO",
> +                    "HPHR", "ZERO",
> +                    "RDAC2 MUX", "RX1",
> +                    "RX1 MIX1 INP1", "ZERO",
> +                    "RX2 MIX1 INP1", "ZERO";
> +            };
> +            headset: Headset {
> +                enable =
> +                    "RX1 MIX1 INP1", "RX1",
> +                    "RX2 MIX1 INP1", "RX2",
> +                    "RDAC2 MUX", "RX2",
> +                    "RX1 Digital Volume", "128",
> +                    "RX2 Digital Volume", "128",
> +                    "DEC1 MUX", "ADC2",
> +                    "CIC1 MUX", "AMIC",
> +                    "ADC2 Volume", "8",
> +                    "ADC2 MUX", "INP2",
> +                    "HPHL", "Switch",
> +                    "HPHR", "Switch";
> +
> +                disable =
> +                    "RX1 Digital Volume", "0",
> +                    "RX2 Digital Volume", "0",
> +                    "HPHL", "ZERO",
> +                    "HPHR", "ZERO",
> +                    "RDAC2 MUX", "RX1",
> +                    "RX1 MIX1 INP1", "ZERO",
> +                    "RX2 MIX1 INP1", "ZERO",
> +                    "ADC2 MUX", "ZERO",
> +                    "ADC2 Volume", "0",
> +                    "DEC1 MUX", "ZERO";
> +            };
> +            speaker: Speaker {
> +                enable =
> +                    "SPK DAC Switch", "1",
> +                    "RX3 MIX1 INP1", "RX1",
> +                    "RX3 MIX1 INP2", "RX2",
> +                    "RX3 Digital Volume", "128";
> +
> +                disable =
> +                    "SPK DAC Switch", "0",
> +                    "RX3 MIX1 INP1", "ZERO",
> +                    "RX3 MIX1 INP2", "ZERO";
> +            };
> +            off: Off {
> +                enable =
> +                    "RX1 Digital Volume", "0",
> +                    "RX2 Digital Volume", "0",
> +                    "HPHL", "ZERO",
> +                    "HPHR", "ZERO",
> +                    "RDAC2 MUX", "RX1",
> +                    "RX1 MIX1 INP1", "ZERO",
> +                    "RX2 MIX1 INP1", "ZERO",
> +                    "ADC2 MUX", "ZERO",
> +                    "ADC2 Volume", "0",
> +                    "DEC1 MUX", "ZERO",
> +                    "SPK DAC Switch", "0",
> +                    "RX3 MIX1 INP1", "ZERO",
> +                    "RX3 MIX1 INP2", "ZERO";
> +            };
> +        };

This looks much like a replacement for ALSA UCM and userspace audio jack
detection coded into the device tree.

While I personally think this is an interesting idea
(We have the device tree to describe the hardware, why can we not also
 describe necessary audio routing to enable a particular output?)
this is also not really specific to the APQ8039 hardware, is it?

In fact, without all the code to handle the mixer enable/disable
sequences the machine driver looks almost identical to the existing
apq8016-sbc.

If you want to discuss ways to integrate mixer enable/disable sequences
into the device tree, I suggest that you post your ideas separately as
[RFC] with a more generic subject. That will make it more easy for
everyone interested to share their thoughts.

Right now it's quite hidden in a patch set where the subjects suggest
that it's just a simple machine driver to glue some codecs together.

Thanks,
Stephan
